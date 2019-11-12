<?php 
/*
© Copyright 2015 FortuNet Inc. All Rights Reserved.
*/
class system_code_lib
{

public $RSV_RETCODE_SUCCESS 			= 0;
public $RSV_ERRCODE_BARCODE_FORMAT 		= -1;
public $RSV_ERRCODE_BARCODE_NOT_FOUND 	= -2;
public $RSV_ERRCODE_TICKET_CANCELLED 	= -3;
public $RSV_ERRCODE_TICKET_NOT_FOUND 	= -4;
public $RSV_ERRCODE_RESERVATION_REMOVED = -5;
public $RSV_ERRCODE_EVENT_NOT_FOUND 	= -6;
public $RSV_ERRCODE_INVALID_DATE 		= -7;
public $RSV_ERRCODE_INVALID_EVENT 		= -8;
public $RSV_ERRCODE_INVALID_COMPANY 	= -9;
public $RSV_ERRCODE_VALIDATION 			= -10;
public $RSV_ERRCODE_CONFIRMATION 		= -11;
public $RSV_ERRCODE_MODE_NOT_SUPPORTED	= -12;
public $RSV_ERRCODE_REFERENCE_MISSING	= -13;
public $RSV_ERRCODE_REFERENCE_NOT_FOUND	= -14;
public $RSV_ERRCODE_RESERVATION			= -15;
public $RSV_ERRCODE_RESERVATION_USED	= -16;

public $RSV_ERRCODE_FILE_NOT_LOADED 	= -21;
public $RSV_ERRCODE_FILE_ALREADY_EXISTS = -22;
public $RSV_ERRCODE_RENAME_FAILED 		= -23;
public $RSV_ERRCODE_UPLOAD_FAILED 		= -24;
public $RSV_ERRCODE_UPLOAD_UNKNOWN 		= -25;

public $RSV_ERRCODE_LOG_NOT_FOUND		= -31;
public $RSV_ERRCODE_USER_NOT_FOUND		= -32;

public $RSV_ERRCODE_PLY_CARD_NOT_FOUND	= -41;

}

class fortunet_lib  extends sql_lib
{

function get_transaction_status($transaction_status_id=NULL,$field=NULL) 
{
		$query = "SELECT * 
				  FROM web_enum_transaction_status 
				  WHERE transaction_status_id = '$transaction_status_id'";
				  //echo $query;
				  //var_dump($query);
	   return $this->get_mysql_line($query,$field);
}
function get_transaction_status_list($transaction_status_id=NULL,$field=NULL,$sort_aux=NULL) 
{
	$sql_aux = "";
	if ($transaction_status_id) $sql_aux .= " AND transaction_status_id = ".$transaction_status_id;
	if ($sort_aux != NULL) $sort_aux =  " ORDER BY ". $sort_aux. " " ;
	$query = "SELECT * 
		  FROM web_enum_transaction_status ".
		  " WHERE 1 = 1 " 
		  .$sql_aux
		  .$sort_aux;
		  //echo $query;
		  //var_dump($query);
	return $this->get_mysql_array($query,$field);	   
}
function get_transaction_type($transaction_type_id=NULL,$field=NULL) 
{
		$query = "SELECT * 
				  FROM web_enum_transaction_type 
				  WHERE transaction_type_id = '$transaction_type_id'";
				  //echo $query;
				  //var_dump($query);
	   return $this->get_mysql_line($query,$field);
}
function get_transaction_type_list($transaction_type_id=NULL,$field=NULL,$sort_aux=NULL) 
{
	$sql_aux = "";
	if ($transaction_type_id) $sql_aux .= " AND transaction_type_id = ".$transaction_type_id;
	if ($sort_aux != NULL) $sort_aux =  " ORDER BY ". $sort_aux. " " ;
	$query = "SELECT * 
		  FROM web_enum_transaction_type ".
		  " WHERE 1 = 1 "
		  .$sql_aux
		  .$sort_aux;
		  //echo $query;
		  //var_dump($query);
	return $this->get_mysql_array($query,$field);	 
}

function get_expiration_type($expiration_type_id=NULL,$field=NULL) 
{
		$query = "SELECT * 
				  FROM web_enum_expiration_type 
				  WHERE expiration_type_id = '$expiration_type_id'";
				  //echo $query;
				  //var_dump($query);
	   return $this->get_mysql_line($query,$field);
}

function get_expiration_types($expiration_type_id=NULL,$field=NULL) 
{
	$sql_aux = "";
	if ($expiration_type_id) $sql_aux .= " AND expiration_type_id = ".$expiration_type_id;
		$query = "SELECT * 
				  FROM web_enum_expiration_type ".
				  " WHERE 1 = 1 ". $sql_aux;
				  //echo $query;
				  //var_dump($query);
	   return $this->get_mysql_array($query,$field);
}

function get_payment_types($payment_type_id=NULL,$field=NULL) 
{
	$sql_aux = "";
	if ($payment_type_id) $sql_aux .= " AND payment_type_id = ".$payment_type_id;
		$query = "SELECT * 
				  FROM web_enum_payment_type ".
				  " WHERE 1 = 1 ". $sql_aux.
				  " ORDER BY payment_display_order ";
				  //echo $query;
				  //var_dump($query);
	   return $this->get_mysql_array($query,$field);
}

function get_user($user_id,$field=NULL) 
{
		$query = "SELECT * 
				  FROM web_usr_user_info ".
				  " WHERE user_id = '".$user_id."'";
				  //echo $query;
				  //var_dump($query);
	   return $this->get_mysql_line($query,$field);
}
function get_user_list($user_id=NULL,$field=NULL,$sql_aux=NULL, $sort_aux=NULL)
{
	if ($user_id) $sql_aux .= " AND user_id = ".$user_id;
	if ($sort_aux != NULL) $sort_aux =  " ORDER BY ". $sort_aux. " " ;
	
	$query = "SELECT * 
			  FROM web_usr_user_info 
			  WHERE 1 = 1 "
			  .$sql_aux
			  .$sort_aux;
			  //echo $query;
	return $this->get_mysql_array($query,$field);
}
	
// COMPANY INI
function get_database_date() 
{
		$query = "SELECT NOW() `DatabaseDate`";
				  //echo $query;
				  //var_dump($query);
	   return $this->get_mysql_line($query,'DatabaseDate');
}

function get_database_date_format() 
{
		$query = "SELECT  DATE_FORMAT(NOW(), '%W, %d %M %Y') `DatabaseDate`";
				  //echo $query;
				  //var_dump($query);
	   return $this->get_mysql_line($query,'DatabaseDate');
}
function get_database_time_format($mysql_format='%r') 
{
		$query = "SELECT  DATE_FORMAT(NOW(), '$mysql_format') `DatabaseTime`";
				  //echo $query;
				  //var_dump($query);
	   return $this->get_mysql_line($query,'DatabaseTime');
}
function get_database_time_status($mysql_format='23:59:59') 
{
		$query = "SELECT  TIMEDIFF('$mysql_format',DATE_FORMAT(NOW(), '%r')) `DatabaseTime`";
				  //echo $query;
				  //var_dump($query);
	   return $this->get_mysql_line($query,'DatabaseTime');
}
function get_database_status($compare_time='2014-01-02 23:59:59') 
{
		$query = "SELECT  TIME_TO_SEC(TIMEDIFF(NOW(),'$compare_time')) `DatabaseDateTime`";
				  //echo $query;
				  //var_dump($query);
	   return $this->get_mysql_line($query,'DatabaseDateTime');
}
function get_company($company_id,$field=NULL) 
{
		$query = "SELECT * 
				  FROM web_usr_company_info ".
				  " WHERE company_id = '".$company_id."'";
				  //echo $query;
				  //var_dump($query);
	   return $this->get_mysql_line($query,$field);
}

function get_companies_list ($company_id=NULL,$field=NULL,$sort_aux=NULL)
{	
	$sql_aux = "";
	if ($company_id) $sql_aux= " WHERE company_id = ".$company_id;
	if ($sort_aux != NULL) $sort_aux =  " ORDER BY ". $sort_aux. " " ;

	$query = "SELECT * 
			  FROM web_usr_company_info "
			  .$sql_aux
			  .$sort_aux;
			  //echo $query;
	return $this->get_mysql_array($query,$field);
}

function get_company_general_filter ($company_id=NULL)
{
	$sql_aux = "";
	if ($company_id!=NULL){
		$companies_child = $this->get_company_child_list($company_id);
		$companies_list = $this->create_field_condition($companies_child['list'],'company_id',',');
		//var_dump($company_id,$companies_list);
		if ($companies_list != NULL && $companies_list != "")
			$sql_aux = '( ' . substr($companies_list,0,strlen($companies_list)-1). ' )' ;
		//var_dump($companies_list , $sql_aux);
	}
	return $sql_aux;
}

function get_company_sql_filter ($company_id=NULL,$condition='AND',$alias=NULL)
{
	$sql_aux = "";
	if ($company_id!=NULL){
		$companies_child = $this->get_company_child_list($company_id);
		$companies_list = $this->create_field_condition($companies_child['list'],'company_id',',');
		//var_dump($company_id,$companies_list);
		if ($companies_list != NULL && $companies_list != "")
			$sql_aux = $condition.' '.$alias.'company_id IN( ' . substr($companies_list,0,strlen($companies_list)-1). ' )' ;
		//var_dump($companies_list , $sql_aux);
	}
	return $sql_aux;
}
function get_company_template_sql_filter ($company_id=NULL,$condition='AND',$alias=NULL)
{
	$filter_company_id = $this->get_company_sql_filter($company_id,$condition,$alias);
	$filter_company_id = " AND (" .$filter_company_id . "  OR company_id = 0 )";
	return $filter_company_id;
}

function create_field_condition($array, $field, $separator=', '){
$return_string = "";
for ($i=1;$i<=count($array);$i++){
	$return_string .= $array[$i][$field].$separator;
}
return $return_string;
}
function get_company_child_list ($company_id=NULL)
{
		$level = 1;
		$company_count = 1;
		$companies['company_id'] = $company_id;
		$companies['level'] = $level;
		$companies['company_count'] = $company_count;
		$companies['child_companies'] = $this->get_recursive_company_child_list($company_id,$level,$companies_array);				
		$companies['list'] = $companies_array;				
		return $companies;
}

function get_recursive_company_child_list ($company_id=NULL,$level,&$companies_array)
{
	//var_dump(count($companies_array),'entro company_id '.$company_id.'<br>');
	if ($company_id != NULL && $company_id != 0)
	{
		//$level security MAX = 6
		if ($level == 6) return;
		$company_count = (is_array($companies_array)) ? count($companies_array)+1 : 0;
		$companies_array[$company_count]['company_id'] = $company_id;
		$companies_array[$company_count]['level'] = $level;
		//var_dump('asigno '.$company_count,'- company_id '.$company_id.'<br>');
	   
		$company_count++;
		$level++;
		$query = "SELECT * 
				  FROM web_usr_company_info
				  WHERE parent_company_id = ".$company_id;
				  //echo $query;
				  
	   $result = $this->get_mysql_array($query);
	   $count_result = (is_array($result))? count($result) : 0;
	   //var_dump('result_count '.count($result),'- company_id '.$company_id.'<br>');	   
	   for ($i=1;$i<=$count_result;$i++)
		{
		  $child_companies[$i]['company_id'] = $result[$i]['company_id'];
		  $child_companies[$i]['level'] = $level;
		  $child_companies[$i]['company_count'] = $company_count;
		  $child_companies[$i]['company_info'] = $result;
		  $childrens = $this->get_recursive_company_child_list($result[$i]['company_id'],$level,$companies_array);
		  //var_dump('- <br> ',$childrens);
		  if (count($childrens)> 0)
		  {
			$child_companies[$i]['child_companies'] = $childrens;	
		  }
		  $company_count =  count($companies_array)+1;
		}
	}	  
	//var_dump('- <br> results: ',$result);
	return $result;
}

function get_parent_company_list($company_id=NULL,$field=NULL,$sql_aux=NULL, $sort_aux=NULL)
{
		if ($company_id) $sql_aux .= " AND company_id = ".$company_id;
		if ($sort_aux != NULL) $sort_aux =  " ORDER BY ". $sort_aux. " " ;
		
		$query = "SELECT * 
				  FROM web_usr_company_info 
				  WHERE 1 = 1 "
				  .$sql_aux
				  .$sort_aux;
				  //echo $query;
		return $this->get_mysql_array($query,$field);
}
// LOOK FOR parents and grand parents companies. opossite to lock company childs.
function get_company_general_parent_filter ($company_id=NULL)
{
	$sql_aux = "";
	if ($company_id!=NULL){
		$companies_parent = $this->get_company_parent_list($company_id);
		$companies_list = $this->create_field_condition($companies_parent['list'],'company_id',',');
		//var_dump($company_id,$companies_list);
		if ($companies_list != NULL && $companies_list != "")
			$sql_aux = '( ' . substr($companies_list,0,strlen($companies_list)-1). ' )' ;
		//var_dump($companies_list , $sql_aux);
	}
	return $sql_aux;
}

function get_company_template_parent_sql_filter ($company_id=NULL,$condition='AND',$alias=NULL)
{
	$filter_company_id = $this->get_company_parent_sql_filter($company_id,$condition,$alias);
	$filter_company_id = " AND (" .$filter_company_id . "  OR company_id = 0 )";
	return $filter_company_id;
}

function get_company_parent_sql_filter ($company_id=NULL,$condition='AND',$alias=NULL)
{
	$sql_aux = "";
	if ($company_id!=NULL){
		$companies_child = $this->get_company_parent_list($company_id);
		$companies_list = $this->create_field_condition($companies_child['list'],'company_id',',');
		//var_dump($company_id,$companies_list);
		if ($companies_list != NULL && $companies_list != "")
			$sql_aux = $condition.' '.$alias.'company_id IN( ' . substr($companies_list,0,strlen($companies_list)-1). ' )' ;
		//var_dump($companies_list , $sql_aux);
	}
	return $sql_aux;
}
function get_company_parent_list ($company_id=NULL)
{
		$level = 1;
		$company_count = 1;
		$companies['company_id'] = $company_id;
		$companies['level'] = $level;
		$companies['company_count'] = $company_count;
		$companies['parent_companies'] = $this->get_recursive_company_parent_list($company_id,$level,$companies_array);				
		$companies['list'] = $companies_array;				
		return $companies;
}


function get_recursive_company_parent_list ($company_id=NULL,$level,&$companies_array)
{
	$result = null;
	//var_dump(count($companies_array),'entro company_id '.$company_id.'<br>');
	if ($company_id != NULL && $company_id != 0)
	{
		//$level security MAX = 6
		if ($level == 6) return;
		$company_count = count($companies_array)+1;
		$companies_array[$company_count]['company_id'] = $company_id;
		$companies_array[$company_count]['level'] = $level;
		//var_dump('asigno '.$company_count,'- company_id '.$company_id.'<br>');
	   
		$company_count++;
		$level++;
		$query = "SELECT parent_company_id 
				  FROM web_usr_company_info
				  WHERE company_id = ".$company_id;
				  //echo $query;
				  
	   $result = $this->get_mysql_array($query);
	   //var_dump('result_count '.count($result),'- company_id '.$company_id.'<br>');
	   for ($i=1;$i<=count($result);$i++)
		{
		  $child_companies[$i]['company_id'] = $company_id;
		  $child_companies[$i]['level'] = $level;
		  $child_companies[$i]['company_count'] = $company_count;
		  $child_companies[$i]['company_info'] = $result;
		  $childrens = $this->get_recursive_company_parent_list($result[$i]['parent_company_id'],$level,$companies_array);
		  //var_dump('- <br> ',$childrens);
		  if (count($childrens)> 0)
		  {
			$child_companies[$i]['parent_companies'] = $childrens;	
		  }
		  $company_count =  count($companies_array)+1;
		}
	}	  
	//var_dump('- <br> results: ',$result);
	return $result;
}

}
?>