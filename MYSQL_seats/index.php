<?php
/*
© Copyright 2015 FortuNet Inc. All Rights Reserved.
*/
session_start();
//header('Cache-Control: max-age=900');
/*

if (empty($_SERVER['HTTPS']) || ('on' != $_SERVER['HTTPS'])) 
{
	$uri = 'https://';
	$uri .= $_SERVER['HTTP_HOST'];
	header('Location: '.$uri.'/Fortunet/');
	exit;
}
*/
require_once('config/system_config.php');
//require_once(PATH.'/libs/session_expiration.php');

require_once(PATH.'/config/db_connection_class.php');
//require_once(PATH.'/config/system_settings.php');
require_once(PATH.'/libs/sql_lib_class.php');
require_once(PATH.'/libs/session_lib_class.php');
require_once(PATH.'/libs/fortunet_lib_class.php');
require_once(PATH.'/libs/conversions.php');
require_once(PATH.'/libs/version.php');
require_once(PATH.'/libs/redirect.php');

$login_manager = new session_lib();
$fortunet_manager = new fortunet_lib();
if (isset($_GET['DemoCompany']))
	$_SESSION['DemoCompany'] = $_GET['DemoCompany'];
if (!isset($_SESSION['DemoCompany']))
	$_SESSION['DemoCompany'] = 'Boyd2';

//var_dump($_SESSION['DemoCompany']);
$version = FTN_VERSION_NUMBER;
$message = "Welcome to " .SERVER_NAME. " | Reservation System | 
Version " . $version . "  ";
$message_error = null;
$message_warning = null;
$force_message = null;
//var_dump($_SESSION['ftn_user_log_id']);

//var_dump($_POST);
$PasswordVisible = false;
$force_session_by_system = SINGLE_SESSION_BY_SYSTEM;
$force_session_by_user = SINGLE_SESSION_BY_USER;
unset($_SESSION['ftn_rsv_player_id'],$_SESSION['ftn_rsv_event_id'],$_SESSION['ftn_rsv_ticket_id'] );

$new_user_option = false;

if (FORCE_SESSION_EXPIRATION && isset($_SESSION['ftn_user_log_id']) && $login_manager->validate_user_log()=="1")
{
		$login_manager->force_unset_session_variables();
		$login_manager->force_unset_cookie_login();	
		$force_message = '<br> <b> SESSION EXPIRED! </b> <br>';
		//var_dump($force_message);
}	
if (isset($_POST['ForceLogoutOption']) && FORCE_SESSION_EXPIRATION==true && CLIENT_GC_MAXLIFETIME)
{
	//echo 'Force Log out';
	//if ()
	{
		$force_logout = $login_manager->get_active_sessions_time(CLIENT_GC_MAXLIFETIME);
		//var_dump($_SESSION['ftn_user_log_id'],$force_logout);
		if ($force_logout && count($force_logout) > 0) //&& !$_SESSION['ftn_user_log_id'])
		{
			$force_message = '<br> Force logout on users connected more than '. secondsToString(CLIENT_GC_MAXLIFETIME).': <br>';
			//var_dump($force_message);
			foreach($force_logout as $key => $force_log_out_login){
				$force_message .= ' - '.$force_log_out_login['user_name'].'<br>';
				$login_manager->log_logout_login($user['user_name'],$force_log_out_login['usr_log_id'],$force_log_out_login['user_name']);	
			}
			$message .= " <br> Force Logout";
		}
		else
		{
			$message .= " <br> Force Logout not allowed!";
		}
		//$login_manager->unset_session_variables();
		//$login_manager->log_logout_login($user['user_name'],$force_log_out_login['usr_log_id'],$force_log_out_login['user_name']);	
	}
	
}	
$login_manager->add_user_log_history('Index','Main','Home Page');
$username1 ='';
if (isset($_POST['logout']))
{
	$session_active = $login_manager->user_log_logout();
	$message = "Welcome to ".SERVER_NAME. " |  Reservation System | 
	Version " . $version . "  <br>";	
	$login_manager->force_unset_session_variables();
	$login_manager->force_unset_cookie_login();	
	//var_dump('Cookie:',$_COOKIE['ftn_user_log_id']);
}  else if (isset($_POST['password1']) && $_POST['password1']== "" && isset($_POST['username1'])){
    $message_warning= "* Password is required!";    
	$username1 = addslashes($_POST['username1']);
	if ($username1 != ''){
		$username_lookup = $login_manager->search_user_name($username1);
		if (!$username_lookup) 
			$new_user_option = true;
	}	
}else if (isset($_POST['password1']) && isset($_POST['username1'])) {
	//var_dump("demo user");
	//var_dump($_POST,$_SERVER['REMOTE_ADDR']);
	$password1 = addslashes($_POST['password1']);
	$username1 = addslashes($_POST['username1']);
	
	$user = $login_manager->check_user($username1,$password1);
	$remote_connection_allowed = $login_manager->check_user_address($user['user_id'],$_SERVER['REMOTE_ADDR']);
	if (!$remote_connection_allowed){
		unset($user);	
		$message = "Connection not allowed from this terminal";
		$message_error = "Connection not allowed from this terminal";
		$login_manager->add_user_log_history('Index','Connection Failed','IP not allowed: '.$username1 . ' ['.$_SERVER['REMOTE_ADDR'].']');
	}else{
		$user_login = $user;	
		if (!$user){
			$message = "Sorry you are not in the System. Try Again:";
			$message_error = "Authentication failed";
			//$login_manager->add_user_log_history('Index','Failed Attemp','Failed Try: '.$username1 . ' / ' .$password1 . ' ['.$_SERVER['REMOTE_ADDR'].']');
			$login_manager->add_user_log_history('Index','Failed Attemp','Failed Try: '.$username1 . ' / xxxxxx ['.$_SERVER['REMOTE_ADDR'].']');
		}else{
			if ($force_session_by_system==true){
				$force_logout = $login_manager->get_remote_system_active_sessions($_SERVER['REMOTE_ADDR']);
				//var_dump($_SESSION['ftn_user_log_id'],$force_logout);
				if ($force_logout && count($force_logout) > 0 && !$_SESSION['ftn_user_log_id'])
				{
					$force_message = '<br> Force logout on users connected from '.$_SERVER['REMOTE_ADDR'].': <br>';
					//var_dump($force_message);
					foreach($force_logout as $key => $force_log_out_login){
						$force_message .= ' - '.$force_log_out_login['user_name'].'<br>';
						$login_manager->log_logout_login($user['user_name'],$force_log_out_login['usr_log_id'],$force_log_out_login['user_name']);	
					}
				}
			}
			if ($force_session_by_user==true){
				$force_logout = $login_manager->get_user_active_sessions($user['user_id']);
				//var_dump($_SESSION['ftn_user_log_id'],$force_logout);
				if ($force_logout && count($force_logout) > 0 && (!isset($_SESSION['ftn_user_log_id']) || !$_SESSION['ftn_user_log_id']))
				{
					//$force_message = '<br> Force logout on user: '.$user['user_name']. '('.$user['user_id'].'): <br>';
					$force_logut_count = 0;
					//var_dump($force_message);
					foreach($force_logout as $key => $force_log_out_login){
						$force_logut_count++;
						$login_manager->log_logout_login($user['user_name'],$force_log_out_login['usr_log_id'],$force_log_out_login['user_name']);	
					}
					$force_message .= "<br> Force logout: " . $force_logut_count . ' user connection(s) were closed.<br>';
				}
			}
			$login_manager->force_unset_session_variables();
			$message = "Welcome to ".SERVER_NAME. " |  Reservation System | 
			Version " . $version . " <br>";
			$_SESSION['ftn_user_id'] = $user['user_id'];
			$_SESSION['ftn_user_log'] = $user['log'];
			$_SESSION['ftn_user_name'] = $user['user_name'];
			$_SESSION['ftn_user_staff_id'] = $user['staff_id'];
			$_SESSION['ftn_company_id'] = $user['company_id'];
			$_SESSION['ftn_company_name'] = $fortunet_manager->get_company($user['company_id'],'company_name');
			$_SESSION['ftn_user_log_id'] = 
			$login_manager->add_log($_SESSION['ftn_user_id'],$_SERVER['REMOTE_ADDR'],$_SESSION['ftn_user_name'],$_SESSION['ftn_company_name'],3,'Login');	
			//var_dump($_SESSION['ftn_user_log_id']);
			$_SESSION['uws_usr_log_id'] = $_SESSION['ftn_user_log_id'];
			$_SESSION['uws_user_id'] = $_SESSION['ftn_user_id'];
			$_SESSION['ftn_production'] = true;	
			$login_manager->add_user_log_history('Index','Main','Login');
			$login_manager->update_last_user_login($user['user_id']);
			
			$login_manager->set_cookie_login();		
				
			//var_dump('update last login 1');		
		}
	}
} else if (isset($_POST['ChangePassword'])) {
	$CurrentPassword = $_POST['CurrentPassword'];
	//var_dump($_SESSION['ftn_user_name']);
	$Password1 = addslashes($_POST['NewPassword1']);
	$Password2 = addslashes($_POST['NewPassword2']);
	$PasswordVisible = true;
	
	if (!$CurrentPassword or $CurrentPassword == "")
		$message = "You must enter your current password to proceed";
	/*else if ($CurrentPassword != $password1)
		$message = "You must enter your current password to proceed!!";*/
	else if ($login_manager->check_password($_SESSION['ftn_user_id'],$CurrentPassword))
		$message = "Current password is incorrect, please try again";
	else if (!$Password1 or $Password1 == "")
		$message = "New password can NOT be empty, please try again";
	else if ($Password1 != $Password2)
		$message = "New password does NOT match, please try again";
	
	else if ($login_manager->change_password($_SESSION['ftn_user_id'],$Password1)){
		$message = "Password Sucessfully Changed";
		$login_manager->add_usr_log_exception($_SESSION['ftn_user_id'], 'xx', 'xx', 'Change Password',$message);		
	}	
	$login_manager->add_user_log_history('Index','Change Password',$message);	
	//var_dump($message);
}
$demo_username = '';
if (isset($_SESSION['ftn_user_id']) && isset($_SESSION['ftn_user_name']))
{
	$user = $login_manager->get_user($_SESSION['ftn_user_id']);
	$demo_username = $_SESSION['ftn_user_name'];
	//var_dump($_SESSION['ftn_user_id'],$user);
}
/*
if (isset($_POST['demouserid']) && $_POST['demouserid'] != "")
{
	$user = $login_manager->get_user($_POST['demouserid']);
    if ($force_session_by_system==true)
		{
			$force_logout = $login_manager->get_remote_system_active_sessions($_SERVER['REMOTE_ADDR']);
			//var_dump($_SESSION['ftn_user_log_id'],$force_logout);
			if ($force_logout && count($force_logout) > 0 && !$_SESSION['ftn_user_log_id'])
			{
				$force_message = '<br> Force logout on users connected from '.$_SERVER['REMOTE_ADDR'].': <br>';
				//var_dump($force_message);
				foreach($force_logout as $key => $force_log_out_login){
					$force_message .= ' - '.$force_log_out_login['user_name'].'<br>';
					$login_manager->log_logout_login($user['user_name'],$force_log_out_login['usr_log_id']);	
				}
			}
		}
	$login_manager->force_unset_session_variables();
	$message = "Welcome to Fortunet.com |  DEMO USER | "
	.SERVER_NAME. " |  Reservation System | 
	Version " . $version . " <br>";
	$_SESSION['ftn_user_id'] = $user['user_id'];
	$_SESSION['ftn_user_name'] = $user['user_name'];
	$_SESSION['ftn_user_staff_id'] = $user['staff_id'];
	$_SESSION['ftn_company_name'] = $fortunet_manager->get_company($user['company_id'],'company_name');
	$_SESSION['ftn_user_log_id'] = 
	$login_manager->add_log($_SESSION['ftn_user_id'],$_SERVER['REMOTE_ADDR'],$_SESSION['ftn_user_name'],$_SESSION['ftn_company_name'],3,'Login');	
	//var_dump($_SESSION['ftn_user_log_id']);
	$_SESSION['uws_usr_log_id'] = $_SESSION['ftn_user_log_id'];
	$_SESSION['uws_user_id'] = $_SESSION['ftn_user_id'];
	$_SESSION['ftn_production'] = true;	
	$login_manager->add_user_log_history('Index','Main','Login');
	$login_manager->update_last_login($user['user_name']);
	
}
*/
//var_dump($user);
if (isset($user))
{
	$login_manager->unset_session_variables();
	$login_manager->unset_cookie_login();	
	if ($user['terminate'] == '1')
	{
		$message = "Sorry, this user has been TERMINATED.";
		$login_manager->add_user_log_history('Index','Terminated User',$user['user_id'].' - '. $user['user_name']);
		$company = $fortunet_manager->get_company($user['company_id']);
		$_SESSION['ftn_company_name'] = $company['company_name'];
	}
	else
	{
		if (is_null($user['company_id']) || $user['company_id'] == 0)
			$user['company_id'] = -1;
		$_SESSION['ftn_user_id'] = $user['user_id'];
		$_SESSION['ftn_user_name'] = $user['user_name'];
		$_SESSION['ftn_user_demo'] = false;
		if ($user['user_name'] == "DemoUser" && $demo_username != ''){
			$_SESSION['ftn_user_name'] = $demo_username;
			$_SESSION['ftn_user_demo'] = true;
		}	
		$_SESSION['ftn_company_id'] = $user['company_id'];
		$_SESSION['ftn_user_staff_id'] = $user['staff_id'];
		$company = $fortunet_manager->get_company($user['company_id']);
		$_SESSION['ftn_company_name'] = $company['company_name'];
		$_SESSION['ftn_company_short_name']= $company['company_short_name'];
		$_SESSION['ftn_user_log'] = $user['log'];
		$_SESSION['ftn_production'] = true;	
		$login_manager->set_cookie_login();	
		
		if (MASTER_COMPANY_ID != $_SESSION['ftn_company_id'])
		{
			$_SESSION['ftn_user_parent_company_filter'] = " " .$fortunet_manager->get_company_parent_sql_filter($_SESSION['ftn_company_id']);	
			$_SESSION['ftn_user_template_parent_company_filter'] = " " .$fortunet_manager->get_company_template_parent_sql_filter($_SESSION['ftn_company_id'],'');	
			$_SESSION['ftn_user_general_parent_company_filter'] = $fortunet_manager->get_company_general_parent_filter($_SESSION['ftn_company_id'],NULL,NULL);
			$_SESSION['ftn_user_company_filter'] = " " .$fortunet_manager->get_company_sql_filter($_SESSION['ftn_company_id']);	
			$_SESSION['ftn_user_template_company_filter'] = " " .$fortunet_manager->get_company_template_sql_filter($_SESSION['ftn_company_id'],'');	
			$_SESSION['ftn_user_general_company_filter'] = $fortunet_manager->get_company_general_filter($_SESSION['ftn_company_id'],NULL,NULL);
			//var_dump($_SESSION['ftn_user_company_filter'],$_SESSION['ftn_user_template_company_filter']);
			$login_manager->set_cookie_filter();		
		}
		else
		{
			unset($_SESSION['ftn_user_parent_company_filter']);
			unset($_SESSION['ftn_user_template_parent_company_filter']);
			unset($_SESSION['ftn_user_general_parent_company_filter']);
			unset($_SESSION['ftn_user_company_filter']);
			unset($_SESSION['ftn_user_template_company_filter']);	
			unset($_SESSION['ftn_user_general_company_filter']);			
			$login_manager->unset_cookie_filter();		
		}
		//var_dump($_SESSION['ftn_user_parent_company_filter']);
				
		$login_manager->add_user_log_history('Index','Main','Reload Information');
		
		//$applications = $login_manager->get_user_applications($user['user_id']);
		$applications = $login_manager->get_user_group_application_filter($user['user_id']," AND application_type= 'Main'","application_type, application_order");
		$applications_settings = $login_manager->get_user_group_application_filter($user['user_id']," AND application_type= 'Settings'","application_type, application_order");
		$permissions = $login_manager->get_user_permissions_like($user['user_id'],'WEB');
		//var_dump($permissions);
		for ($i1=1;$i1<=count($permissions);$i1++){
			$_SESSION['ftn_user_permissions'][$permissions[$i1]] = 'On';
		} 
			
		if (count($applications)==1)
		{
			$_SESSION['ftn_application_id'] = $applications[1]['application_id'];
			//var_dump($_SESSION['ftn_application_id']);
		}	

		$player_interfaces=$login_manager->get_player_interfaces_list(NULL,NULL," AND (status = '' OR status = 'Active') ",NULL);	
		$user_player_interfaces = array();
		$count_player_interface = (is_array($player_interfaces)) ? count($player_interfaces) : 0;
		for ($i=1;$i<=$count_player_interface;$i++){
			if ($player_interfaces[$i]['interface_permission_name']){
				if (isset($_SESSION['ftn_user_permissions'][$player_interfaces[$i]['interface_permission_name']])){
					array_push($user_player_interfaces, $player_interfaces[$i]);
				}
			}else{
				array_push($user_player_interfaces, $player_interfaces[$i]);
			}
		}	
		$_SESSION['user_player_interfaces'] = $user_player_interfaces;		
	}
}

?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title><?php echo FTN_APPLICATION_NAME ?></title>

<link rel="stylesheet" type="text/css" href="css/global.css"/>
<link rel="stylesheet" type="text/css" href="css/nav.css"/>
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css"/>
<link rel="icon" type="image/ico" href="site_images/favicon.ico">

<script type="text/javascript" src="jquery/jquery.min.js"></script>
<script type="text/javascript" src="jquery/jquery-ui.js"></script>
<script type="text/javascript" src="jquery/jquery-ui.min.js"></script>
<script type="text/javascript" src="jquery/jquery.idletimer.js"></script>
<script type="text/javascript">
function ResetFields()
{
	document.loginform.username1.value = "";
	document.loginform.password1.value = "";
}


function SubmitDemoUser(user_id)
{
	document.loginform.demouserid.value = user_id;
	document.loginform.submit();
}

function SubmitForceLogout()
{
	document.ForceLogoutForm.submit();
}
function LoadPage(PageName,ElementId,Action){
$("#href_navigate").attr("action", PageName);
$("#href_navigate input#p_href_URL").val(PageName);
$("#href_navigate input#p_href_id").val(ElementId);
$("#href_navigate input#p_href_action").val(Action);
$("#href_navigate").submit();
};

jQuery(function($){
	$("#ContinueOnDemo").click(function (e) {
		LoadPage('DBChatRoom/game_board_login.php','<?php echo $username1; ?>','Demo User');
	});
	$("#NewAccount").click(function (e) {
		LoadPage('UserSettings/user_registration.php','<?php echo $username1; ?>','Demo User');
	});
	$("#BackToLogin").click(function (e) {
		LoadPage('index.php','','');
	});
	$("#BackToLoginNoDemo").click(function (e) {
		LoadPage('index.php','','');
	});
});
				
<?php

$onload ="";
if (isset($_POST['demouserid']) || isset($user_login))
{
	if (isset($applications) && count($applications) == 1)
	{
	$onload = ' onLoad="javascript:LoadApplication()"';
	?>
	function LoadApplication()
	{
		LoadPage('<?php echo CLIENT_PATH."/".$applications[1]['web_folder'];?>','','View');			
	}
	<?php
	}			
}
?>
</script>
<style type="text/css">
body { border-top:3px solid #4a83d9; background:none;}
header em { margin-top:2px; }
header em img{ height:35px }
header .navWrap { margin-top:0px; background:#fff; }
</style>
</head>

<body <?php echo $onload?>>
<?php 
if (isset($_SESSION['ftn_user_id']) && CLIENT_GC_MAXLIFETIME > 0)
	require_once ("./common/SiteSessionExpiration.php"); ?>

<form id='href_navigate' name='href_navigate' method="post">
<input type='hidden' id='p_href_URL' name='p_href_URL' value=''>
<input type='hidden' id='p_href_id' name='p_href_id' value=''>
<input type='hidden' id='p_href_action' name='p_href_action' value=''>
</form>
<header>
	<div class="hWrap">
    <div class="navWrap">
    		<div class="signInPnl">
			<?php 
			//var_dump($_SESSION['ftn_user_log_id']);
			if (isset($_SESSION['ftn_user_name']) && isset($_SESSION['ftn_user_log_id']) && $_SESSION['ftn_user_log_id']){?>          
        	<p>
			<?php echo $_SESSION['ftn_company_name'] . "&nbsp;&nbsp; | &nbsp;&nbsp;"?>
			Logged in as <a id="ShowLogSettings" href="#"><?php echo $_SESSION['ftn_user_name'] ?></a> &nbsp;|&nbsp;
			<a class="LoginLink" href="javascript:document.logoutform.submit();" id="logout" > Log out</a> </p>
			<?php } else {?>
			<p><a class="LoginLink" href="javascript:document.logoutform.submit();" id="logout" > Please log in. </a> </p>
			<?php } ?>
        	</div>
        </div>
    	<em><img src="site_images/fLogo.gif" width="135" height="35" alt="bwLogo"></em>
        <div class="indexMsgHdr">
        <?php 
		if (!isset($_POST['ChangePassword']) && !$new_user_option) 
			echo $message.$force_message ?>
        </div>  
    </div>
     
</header>

<div class="container">


		
<?php
if (isset($user))
{

?>  
    <div class="indxBc">
    	<aside>
        	<ul id="lgin">
            	<!--- <li><a href="javascript:document.logoutform.submit();" >Log out</a></li> -->
               <?php if (isset($_SESSION['ftn_user_name'])){ ?>
			   <li><a href="UserSettings/user_registration.php">Create Account</a> &nbsp; </li>
               <?php }
			   if ($user['user_name'] != 'DemoUser'){ ?>
			   <li><a id="ShowPasswordForm" href="#" >Change Password</a> &nbsp; | </li>
                <li><a id="ShowUserSettings" href="#" >User Profile</a>&nbsp; | </li>
				<?php } ?>
				<!--- <p><a href="UserSettings/user_registration.php">Create Account</a> 
                <a id="ShowPasswordForm" href="#" >Change Password</a> 
                <a id="ShowUserSettings" href="#" >User Settings</a> </p> -->
            </ul>        	
        </aside>
    </div>    
<?php 
//var_dump($PasswordVisible) ?>
	<div class="idxInfoBx"> 
    <form name="changepassowrdform" method="post">	
		<div id="ChangePassword" class="indexChgPswrd
    	<?php if (!isset($_POST['ChangePassword'])) 
		{ echo ' show_hide'; } ?>" name="ChangePassword">
		<input type="hidden" name="ChangePassword" id="ChangePassword" value="ChangePassword" />
		<section>
        <dl><h4><?php if (isset($_POST['ChangePassword'])) echo $message; 
		else echo 'Change your password:'?></h4>
		<?php if ($message != "Password Sucessfully Changed") { ?> 
				<dd><input type="password" name="CurrentPassword" id="CurrentPassword" value="" /></dd>
				<dt>Current Password:</dt>
            	<dd><input type="password" name="NewPassword1" id="NewPassword1" value="" /></dd>
                <dt>New Password:</dt>
            	<dd><input type="password" name="NewPassword2" id="NewPassword2" value="" /></dd>
                <dt>Re-Type Password:</dt>
                <dd>
                	<div >
						<input type="submit" class="btn" style="width:180px; height:40px" value="Change Password"/>
                	</div>
                </dd>
                <dt></dt>
            <?php } ?>     
            </dl>
            
        </section>
    </div>
	</form>


    <div id="UserSettings" class="show_hide" name="UserSettings">    	
		<dl>
		<h4>User Profile</h4>       		
        	<dd><input type="text" class="idxInfoBxInp" name="myfield" id="f1" value="<?php echo $user['first_name'] .' '. $user['last_name']?>" /></dd>
        	<dt>Name:</dt>
        	<dd><input type="text" class="idxInfoBxInp" name="myfield" id="f2" value="<?php echo $user['user_name'] ?>" /></dd>
        	<dt>Username:</dt>
        	<dd><input type="text" class="idxInfoBxInp" name="myfield" id="f3" value="<?php echo $_SESSION['ftn_company_name']?>" /></dd>
        	<dt>Company Name:</dt>
            <dd></dd>
            <dt><!--<input type="checkbox" onClick="javascript:ShowChangePassword(this.checked)"  id="checkChangePassword"
             style="margin:10px 0 0 0; float:left;"
       <?php //if ($_POST['ChangePassword']) echo 'checked="checked"'; ?> >--></dt>
        </dl> 
	</div>
  
	</div>	

<?php
}
else
{
?>  
	<div class="indxBc">
    	<aside>
			<ul id="lgout" style="display:none;">
			<li><a href="#" >Sign In</a></li>
            <?php if (isset($_SESSION['ftn_user_permissions']['WEB_USR_USER_NEW'])) {?>
						<li><a href="UserSettings/registration.php">Create Account</a> &nbsp; |&nbsp;</li>
				<?php } ?>	
             </ul>        	
        </aside>
    </div>    
    <?php 
	// Check previous active logins from same computer/same identification number 
	// Closes previous active logins when log in!.
	// get_system_user_last_activity
	?> 
<form name="loginform" method="post" >
	<div id="hideMe" class="formWrapper">
		<h2>Please log in to your account</h2>
  			<section>		
    			<input type="hidden" name="demouserid" id="demouserid" value=""/><br>
            	<fieldset id="inputs"  style="width:400px;">
					<table class="loginTable" style="width:300px;"><tr><td>
						<label style="width:220px; margin-right:20px;">Username:</label></td><td>
						<input type="text" name="username1" id="username1" class="indx" value="<?php echo isset($username1)?$username1:""; ?>" autofocus style="width:200px;"/>
						</td><tr><tr><td>
						<label style="width:220px; margin-right:20px;">Password:</label></td><td>
						<input type="password" name="password1" id="password1" class="indx" value="" style="width:200px;"/><br>
						</td></tr>
						</table>
					</fieldset>	
					<fieldset style="width:550px;">
					<?php if (isset($message_error) && $message_error) {?>
						<label class="label_error">
								<!-- * Authentication failed! -->
							<p><?php echo $message_error; ?></p></label>
						<?php } ?>	
						<?php if (isset($message_warning) && $message_warning) {?>
						<label class="label_warning">
								<!-- * password is required! -->
							<p><?php echo $message_warning; ?></p></label>
						<?php } ?>	
					</fieldset>						
			 <?php  $username_lookup = $login_manager->search_user_name('DemoUserTemplate');
				if ($new_user_option) { ?>
				<fieldset id="actions">
                    <input type="submit" value="Try Again"  class="btn"/>
                    <input name="Reset" type="button" value="Reset" class="btn cancel"
                     onClick="javascript:ResetFields();" />					
				</fieldset>
				</section>
				<h2><strong><?php echo $username1?> </strong> is available:</h2> 
				<section>
				<fieldset id="actions">                	
					 <?php 
					   if ($username_lookup) { 
						// this option when I finish reservations by user_name and demo login on this index page
						// instead of DBChatRoom/bame_board_login.php
						//<input type="button" id="ContinueOnDemo" value="Continue on demo mode..."  class="btn"/><br><br>
							?>
							<input type="button" id="NewAccount" value="Create new account"  class="btn"/><br><br>
							<input type="button" id="BackToLogin" value="Back to Login"  class="btn"/>
					<?php } else { ?>
					Please contact your manager<br>
					to create an account<br><br>
					<input type="button" id="BackToLoginNoDemo" value="Back to Login"  class="btn"/>
					<?php } ?>
				</fieldset>                   
				<?php } else { ?>
				 <fieldset id="actions">
                    <input type="submit" value="Login"  class="btn"/>
                    <input name="Reset" type="button" value="Reset" class="btn cancel"
                     onClick="javascript:ResetFields();" />					
				</fieldset>
				<fieldset id="actions">
					<?php if ($username_lookup) { ?>
					<a href="UserSettings/user_registration.php">Create new account</a>
					&nbsp;&nbsp;|&nbsp;&nbsp;
					<?php } ?>
					<a href="UserSettings/password_reset.php">Forgot password?</a>
				</fieldset>
				</section>
				<h2>Or continue as a guest user</h2>
				<section>
				<fieldset id="actions">
					<input name="guestlogin" type="button" class="btn"  onclick="window.location='SeatsDisplay';" id="guestlogin" value="Enter" >
				</fieldset>			   
				<?php } ?>
		</section>
	</div>
</form>
    	
<?php
}
?>  
<?php //if (!$user) echo $message.$force_message; ?>
        

        
<!-- Begins User Info -->

    	<?php
	//var_dump($user);
    if (isset($user))
	{
	?>

<!--- Begins Wrap -->
	<div class="IndxWrap">
		<ul class="pboxUL">
    
       <?php
	   //var_dump($applications);
	if (isset($applications) && $applications != null)
	{
		//var_dump($applications);
		foreach($applications as $key => $application){
			if ($application["application_target"]!= null &&  $application["application_target"]!="")
				$application_target = " target='".$application["application_target"]."'";
			else
				$application_target = "";
		    if ($application["web_folder"]!= null &&  $application["web_folder"]!="")		
		   {
			   echo '<li>
			   <a class="panelBox bLnk blueGrad" href="'. $application["web_folder"]  .'" '.$application_target.'>';
			   echo '<img class="pbImg" '; 
		   	   if ($application["image"]!= null &&  $application["image"]!="")		
			   		echo 'src="FileManagement/reservation_images/'.$application["image"].'"';
				else
					echo 'src="site_images/blank.png"';
			   echo '/>';	
		   	   echo $application["application_name"] .'</a></li>';
		   }
		   else
		   {
		   		echo '<li class="panelBox bLnk blueGrad">';
				echo '<img class="pbImg" '; 
		   	   if ($application["image"]!= null &&  $application["image"]!="")		
			   		echo 'src="FileManagement/reservation_images/'.$application["image"].'"';
			   else
					echo 'src="site_images/blank.png"';
			   echo '/>';	
			   echo fixlength($application["application_name"],30) .'</li>';
		   }
        }
	}else{
		echo 'There are no applications associated to this account!';
	}
	?>
  <form name="logoutform" method="post">


    <input type="hidden" name="logout" id="logout" value="logout"  />
	<!--    <input type="submit" value="Logout" class="btn cancel" /> -->
 </form>
   
    
    </ul>
 </div>   
 
<!--- Begins Wrap -->
	<div class="IndxWrap">
		<ul class="pboxUL">
    
       <?php
	   //var_dump($applications);
	if (isset($applications_settings) && $applications_settings != null)
	{
		//var_dump($applications_settings);
		foreach($applications_settings as $key => $application_setting){
			if ($application_setting["application_target"]!= null &&  $application_setting["application_target"]!="")
				$application_target = " target='".$application_setting["application_target"]."'";
			else
				$application_target = "";
		    if ($application_setting["web_folder"]!= null &&  $application_setting["web_folder"]!="")		
		   {
			   echo '<li>
			   <a class="panelBox bLnk blueGrad" href="'. $application_setting["web_folder"]  .'" '.$application_target.'>';
			   echo '<img class="pbImg" '; 
		   	   if ($application_setting["image"]!= null &&  $application_setting["image"]!="")		
			   		echo 'src="FileManagement/reservation_images/'.$application_setting["image"].'"';
				else
					echo 'src="site_images/blank.png"';
			   echo '/>';	
		   	   echo $application_setting["application_name"] .'</a></li>';
		   }
		   else
		   {
		   		echo '<li class="panelBox bLnk blueGrad">';
				echo '<img class="pbImg" '; 
		   	   if ($application_setting["image"]!= null &&  $application_setting["image"]!="")		
			   		echo 'src="FileManagement/reservation_images/'.$application_setting["image"].'"';
			   else
					echo 'src="site_images/blank.png"';
			   echo '/>';	
			   echo fixlength($application_setting["application_name"],30) .'</li>';
		   }
        }
	}
	?>
    </ul>
 </div>   
  <?php
	}

	if ($_SESSION['DemoCompany'] == "F0rtuN3t1")
		$demo_company = "75";
	if ($_SESSION['DemoCompany'] == "Boyd2")
		$demo_company = "82";
	if ($_SESSION['DemoCompany'] == "Bjs3")
		$demo_company = "90";
	if ($_SESSION['DemoCompany'] == "Table4")
		$demo_company = "103";
	if ($_SESSION['DemoCompany'] == "Fantasy5")
		$demo_company = "80";
	
	$demo_company_list = $fortunet_manager->get_company_general_filter($demo_company,NULL,NULL);
	if ($demo_company_list)
		$demo_users = $login_manager->get_demo_company_users("AND wuui.company_id IN ". $demo_company_list);
	$ForceLogoutOption = false;		
	
?> 	
</div>    
<?php
if (!$new_user_option && (!isset($user) || $user['user_name'] != 'DemoUser')) {	
?> 	  
<div class="tabSystem">

	<div id="tabs">
    	<ul>
			<?php if (count($demo_users)){?>
        	<li style="margin-left:20px"><a href="#tabs-1">Demo Connections</a></li>
			<li><a href="#tabs-2">Connection Log</a></li>
			<?php } else 
				$marginLeft = 'style="margin-left:200px"'?>
			<li <?php echo $marginLeft; ?>><a href="#tabs-4">Disclaimer</a></li>
    		<li><a href="#tabs-3">Connection Settings</a></li>
    		<li><a href="#tabs-5">Release Notes</a></li>
    	</ul>
    <?php if (count($demo_users))	{	?>	    
        <!-- BEGINS TAB 1 -->
    <div id="tabs-1" class="tabChildWrap" style="padding-top:40px;">
	<div class="formWrapper">
		<h2>Demo Users</h2>
  		<section class="indxPad">

		<form name="demologinform" method="post" >
		<input type="hidden" id="demologin" value="demologin">
		<table class="hoverTable">
		<tr>
			<th class="gry">&nbsp;</th>
			<th class="gry">Company</th>
			<th class="gry">User</th>
			<th class="gry">Last Login</th>
			<th class="gry">Last Ip</th>
		</tr>
		<?php 
		for ($demo_count=1;$demo_count<=count($demo_users);$demo_count++)
		{
		$user_activity = $login_manager->get_user_last_activity($demo_users[$demo_count]['user_id']);
		$current_connection = "";
		if ($user["user_id"] == $demo_users[$demo_count]['user_id'])
			$current_connection = ' class="ftr"';
		
		//Add another color to Online users!
		//if (count($user_activity) == 0 || $user_activity[1]['description'] == "Logout")	{
			//$current_connection = ' class="ftr"';
		
		//var_dump($demo_users[$demo_count]['user_name'],$user_activity,'<br>');
		//onclick="javascript:location.href="UserSettings/password_reset.php""
		$remote_address = "Unknown";
		if ($user_activity[1]['remote_address']!="")
			$remote_address = $user_activity[1]['remote_address'];
		?>
		<tr <?php echo $current_connection?>>
			<td><?php echo $demo_count?></td>
			<td class="bdrNone">
		<?php echo $demo_users[$demo_count]['company_name'];//$fortunet_manager->get_company($demo_users[$demo_count]['company_id'],'company_name')
		?></td>			
		<?php if (count($user_activity) == 0 || $user_activity[1]['expired_on'] != "1111-11-11 11:11:11")	{
			if ($user){
				echo '<td> Offline - '.$demo_users[$demo_count]['user_name'].' </td>';				
			} else {?>
			<td  class="BdrL0">
			<!-- <input type="submit" value="Connect as <?php echo $demo_users[$demo_count]['user_name']?>"  class="btn" id="<?php echo $demo_users[$demo_count]['user_id'] ?>"/> -->
			<input type="button" value="Connect as <?php echo $demo_users[$demo_count]['user_name']?>"  class="btnSm" 
			id="<?php echo $demo_users[$demo_count]['user_id'] ?>" 
			onclick="javascript:SubmitDemoUser('<?php echo $demo_users[$demo_count]['user_id'] ?>')"/>
			</td>			
			<?php }
			} else { 	
				$ForceLogoutFlag = "";
				if ($user_activity[1]['LastActivity'] > CLIENT_GC_MAXLIFETIME)
				{
					$ForceLogoutOption = true;
					$ForceLogoutFlag = "*";
				}
				if ($current_connection != ""){
					if ($_SERVER['REMOTE_ADDR'] == $user_activity[1]['remote_address'])
						echo '<td  class="BdrL0"> <b>Current Connection</b>';
						//&nbsp;&nbsp;&nbsp;<a class="delLnk" href="javascript:document.logoutform.submit();" id="logout">Logout</a></td>';
					else 
					{
						echo '<td  class="BdrL0">'.$ForceLogoutFlag.'<b>'.$demo_users[$demo_count]['user_name'].'</b>  - Last activity:'.fixlength(secondsToAbbreviation($user_activity[1]['LastActivity']),30).' ('.$user_activity[1]['usr_log_id'].')</td>';
					}
				}else{
				?>
					<td class="BdrL0"><?php echo $ForceLogoutFlag ?><b><?php echo $demo_users[$demo_count]['user_name'] ?></b>  - Last activity: <?php echo fixlength(secondsToAbbreviation($user_activity[1]['LastActivity']),30).' ('.$user_activity[1]['usr_log_id'] .')'?></td>			
			<?php }
			} ?>
			<td  class="bdrNone"><?php echo $demo_users[$demo_count]['last_login']?></td>
			<td class="BdrL0"><?php echo $remote_address?></td>
		</tr>
		<?php		
		}
		?>
		</table><br><br>        
		</form>
        <?php if ($ForceLogoutOption == true) {?>
			* Connection open for more than 
			<?php
			$ClientTime = CLIENT_GC_MAXLIFETIME; 			
			echo secondsToString($ClientTime) ?>
			<br>			
		<?php } ?>
		</section>
	</div>
	</div>
        <!-- ENDS TAB 1 -->
        
        
        <!-- BEGINS TAB 2 -->
        <div id="tabs-2" class="tabChildWrap" style="padding-top:40px;">
		<?php 
		//$remote_connections = $login_manager->get_remote_systems();
		//$remote_connections = $login_manager->get_last_logins();
		//$remote_connections = $login_manager->get_remote_address_last_logins();
		if ($demo_company_list)
		$remote_connections = $login_manager->get_remote_company_users_last_logins("AND wuui.company_id IN ". $demo_company_list);
		//$demo_users = $login_manager->get_demo_company_users("AND wuui.company_id IN ". $demo_company_list);
		
		$ForceLogoutOption = false;
		if (count($remote_connections ))
		{ ?>
		<div class="formWrapper">
  		<h2>Connection Log</h2>
		<section class="indxPad">
       	<table class="hoverTable">
		<tr>
			<th class="gry">&nbsp;</th>
			<th class="gry">Id</th>
			<th class="gry">Ip</th>
			<th class="gry">User</th>
			<th class="gry">Last Activity</th>
			<th class="gry">Last Login</th>
		</tr>
		<?php 
		for ($remote_count=1;$remote_count<=count($remote_connections);$remote_count++)
		{ 
		//$system_last_activity = $login_manager->get_system_user_last_activity($remote_connections[$remote_count]['remote_address'],$remote_connections[$remote_count]['user_id']);
		$system_last_activity = $login_manager->get_usr_log_last_activity($remote_connections[$remote_count]['last_usr_log_id']);
		//var_dump($remote_count, $system_last_activity,$remote_connections[$remote_count]['expired_on'],'<br>');
		$current_system_state = "";
		if (count($system_last_activity) == 0 || $remote_connections[$remote_count]['expired_on'] != "1111-11-11 11:11:11")
			$current_system_state = 'Offline ';	
		else
		{
			$ForceLogoutFlag = "";
			if ($system_last_activity['LastActivity'] > CLIENT_GC_MAXLIFETIME)
			{
				$ForceLogoutOption = true;
				$ForceLogoutFlag = "*";
			}
				
			$current_system_state = $ForceLogoutFlag.'<b>Online</b> - Last activity: '. fixlength(secondsToAbbreviation($system_last_activity['LastActivity']),30);
			
		}
		$current_system_connection = "";
		//if ($_SERVER['REMOTE_ADDR'] == $remote_connections[$remote_count]['remote_address'] && 
		//	$user["user_id"] == $remote_connections[$remote_count]['user_id'])
		if ($remote_connections[$remote_count]['last_usr_log_id'] == $_SESSION['ftn_user_log_id'])		
			$current_system_connection = ' class="ftr"';
		//var_dump($system_last_activity);		
		?>
		<tr <?php echo $current_system_connection; ?>>
			<td><?php echo $remote_count ?></td>
			<td><?php echo $remote_connections[$remote_count]['last_usr_log_id'] ?></td>
			<td class="bdrNone"><?php echo $remote_connections[$remote_count]['remote_address']?></td>
			<td class="bdrNone"><?php echo $system_last_activity['user_name']?></td>
			<td class="bdrNone"><?php //echo $current_system_connection.$current_system_state;
			if ($current_system_connection == "") 
			{
				echo $current_system_state;
			}
			else
			{
				echo '<b>Current Connection</b>';
				// &nbsp;&nbsp;&nbsp;<a class="delLnk" href="javascript:document.logoutform.submit();" id="logout">Logout</a>';				
			}
			?>
			</td>
			<td class="BdrL0"><?php echo $system_last_activity['LastLogin']?></td>
		</tr>		
		<?php } ?>
		</table><br><br>
		<?php if ($ForceLogoutOption == true) {?>
			* Connection open for more than 
			<?php
			$ClientTime = CLIENT_GC_MAXLIFETIME; 			
			echo secondsToString($ClientTime) ?>
			<br>
			&nbsp;&nbsp; 
			<?php if (FORCE_SESSION_EXPIRATION == true) {?>
				<form id="ForceLogoutForm" name="ForceLogoutForm"  method="post">
				<input type="hidden" id="ForceLogoutOption" name="ForceLogoutOption" value="ForceLogoutOption">
				<input type="button" value="Force Logout"  class="blueTrans" 
				id="ForceLogout" 
				onclick="javascript:SubmitForceLogout()"/>			
				</form>
			<?php } ?>
			
		<?php } ?>
		</section>
		</div>
		<?php }	?>	
        </div>  
        <?php } ?>
		<!-- ENDS TAB 2 -->
		<!-- BEGINS TAB 4 -->
    	<div id="tabs-4" class="tabChildWrap" style="padding-top:40px;">
        
		<div class="formWrapper">
  		<section class="indxPad inxBdr">
       	<?php { ?>							
				<h5><?php echo FTN_APPLICATION_DISCLAIMER?></h5>
  					<ul>
                    	<li>Compatible with HTML5/CSS3 only - Not compatible with IE9 or older.<br><br>
						</li>
					</ul>
				<ul>
					<li>This software and the materials and products on this software are provided "as is" and without
					warranties of any kind, whether express or implied. To the fullest extent permissible pursuant 
					to applicable law, FortuNet, Inc. disclaims all warranties, express or implied, including, but 
					not limited to, implied warranties of merchantability and fitness for a particular purpose and 
					non-infringement. <br><br>
					FortuNet, Inc. does not represent or warrant that the functions contained in 
					the software will be uninterrupted or error-free, that the defects will be corrected, or that this 
					software is free of viruses or other harmful components. <br><br>
					FortuNet, Inc. does not make any 
					warrantees or representations regarding the use of the materials in this software in terms of their 
					correctness, accuracy, adequacy, usefulness, timeliness, reliability or otherwise. <br><br>
					Fortunet, Inc. does not make any warrantees or representations regarding the results generated by the software 
					in terms of their correctness, accuracy, adequacy, usefulness, timeliness, reliability or otherwise. <br><br>
					Some states either limit or do not permit limitations or exclusions on warranties, so the above 

					limitations may have limited application to you.<br><br>
					</li>
				</ul>
				<ul>
                    	<li><?php echo FTN_APPLICATION_NAME?> Version <?php echo FTN_VERSION_NUMBER;?></li>
						<li>&copy; Copyright <?php echo FTN_VERSION_YEAR?>  FortuNet Inc. All Rights Reserved</li>
					</ul>
		<?php } /*else { ?>													
            <h5>This site is for development and demonstration only</h5>
  					<ul>
                    	<li>Compatible with HTML5/CSS3 only - Not compatible with IE9 or older.<br><br>
						</li>
						<li><b>Reservation Settings:</b></li>
                        <li>- No restriction on number of seat selected.</li>
                        <li>- Seat selection will lock the seat.</li>
                        <li>- Seat selection does not expire.</li>
                        <li>- Ticket printing and validation per room only.</li>
						<li>- Selection process per room only.</li>
						<li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                    <ul>
                    	<li><b>Under Construction:</b></li>
                        <li>- Event Mangement / Edit room layout.</li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
				<ul>
                    <li><b>Not supported:</b></li>
                      <li>- RoomDesigner 1.0.0: Move more than one rotated component. </li>
                      <li>- RoomDesigner 1.0.0: Add images to components. </li>
                      <li>- Edit Room Layout on a scheduled event. </li>
                    </ul>
		<?php } */?>		
		</section>
		</div>
		</div>  
         <!-- ENDS TAB 4 -->
		 <!-- BEGINS TAB 3 -->
    	<div id="tabs-3" class="tabChildWrap" style="padding-top:40px;">
		<div class="formWrapper">
  		<h2>Connection Settings</h2>
		<section class="indxPad">       	
		<table class="hoverTable">
		<tr>
			<th class="gry">Setting</th>
			<th class="gry">Value</th>
		</tr>
		<tr>
			<td>Server Timeout</td>
			<td><?php 
			$sessTime = ini_get('session.gc_maxlifetime'); 
			echo secondsToString($sessTime);	
			?> 
		</td>
		</tr>
		<tr>
			<td>Application Timeout</td>
			<td><?php $ClientTime  = CLIENT_GC_MAXLIFETIME; 			
			echo secondsToString($ClientTime);
			?></td>
		</tr>
		<tr>
			<td>Force logout</td>
			<td><?php if(FORCE_SESSION_EXPIRATION==true) echo "On"; else echo "Off";?></td>
		</tr>
		<tr>
			<td>Allow multiple connections same Ip</td>
			<td><?php if(SINGLE_SESSION_BY_SYSTEM==true) echo "Off"; else echo "On";?></td>
		</tr>
		<tr>
			<td>Allow multiple connections same User</td>
			<td><?php if(SINGLE_SESSION_BY_USER==true) echo "Off"; else echo "On";?></td>
		</tr>
		<tr>
			<td>Email notifications</td>
			<td><?php if(EMAIL_NOTIFICATIONS==true) echo "On"; else echo "Off";?></td>
		</tr>
		</table>
		</section>		
		</div>
		</div>  
         <!-- ENDS TAB 3 -->
		<!-- BEGINS TAB 5 -->
    	<div id="tabs-5" class="tabChildWrap" style="padding-top:40px;">
			<div class="formWrapper" >  
				<section class="indxPad inxBdr">
                <h5>Release Notes:</h5>
				<ul>
                    <li><br /></li>
                </ul>
				<ul>
                <li><b>Version 1.0.5.4</b></li>
					<li>Additions of new ticket confirmation scanning module</li>
					<li>Additions and changes to reports</li>
					<li>Updates to event creation</li>
					<li>Event displays show seat type totals</li>
					<li>UI and printout quality of life changes</li>
					<li>&nbsp;</li>		
                </ul>
				<ul>
                <li><b>Version 1.0.5.3</b></li>
					<li>Additions to reports</li>
					<li>Ability to change seats that have a discount applied</li>
					<li>&nbsp;</li>		
                </ul>
				<ul>
                <li><b>Version 1.0.5</b></li>
					<li>Overhaul and additions to reports</li>
					<li>&nbsp;</li>		
                </ul>
				<ul>
                <li><b>Version 1.0.4</b></li>
                    <li>- Payment Module</li>
					<li>- Email options</li>
					<li>- Report changes</li>
					<li>- Voiding process changed</li>
					<li>&nbsp;</li>		
                </ul>				    
				<ul>
                <li><b>Version 1.0.3</b></li>
                    <li>- Event Display</li>
					<li>- Configuration Module</li>
					<li>&nbsp;</li>		
                </ul>				    
				<ul>
                <li><b>Version 1.0.2</b></li>
                    <li>- Discount Module</li>
					<li>- Report Module</li>
					<li>&nbsp;</li>		
                </ul>				    
				<ul>
                    <li><b>Version 1.0.1</b></li>
                    <li>- Special Events Reservations</li>
                    <li>- Daily Reservations</li>
                    <li>&nbsp;</li>					
                </ul>								
			</section>
             
        </div>
        <!-- ENDS TAB 5 -->
		
	</div>
</div>  
</div>
<?php
}	
?>       
<script type="text/javascript">
$('#ShowPasswordForm').click(function() {
	$('#ChangePassword').slideToggle('slow');
	return false;
});
$('#ShowUserSettings').click(function() {
	$('#UserSettings').slideToggle('slow');
	return false;
});
$('#ShowLogSettings').click(function() {
	$('#UserSettings').slideToggle('slow');
	return false;
});
$(function() {
$( "#tabs" ).tabs();
});
</script>                
</body>
             

</html>
