<?php 
/*
© Copyright 2015 FortuNet Inc. All Rights Reserved.
*/
class sql_lib  extends db_connection
{
var $debug_mode;
// CONNECTIONS
function sql_lig()
{
	$debug_mode = false;
}

function get_connect($connection_type=NULL){
	if ($connection_type == 'WEB'){
		return $this->get_system_connect();
	} else if ($connection_type == 'Casino'){
		return $this->get_casino_connect();
	} else if ($connection_type == 'BingoStar'){
		return $this->get_bingostar_connect();
	} else if ($connection_type == 'Edge'){
		return $this->get_edge_connect();
	}
	return $this->get_system_connect();
}

// MYSQL FUNCTIONS INI

function test_mysql_connect($connect) {
	
	$conn = @mysqli_connect($connect['server'], $connect['dbuser'],  $connect['dbpassword']); 
			// "@" is necessary.
	if(!$conn) return "No conection to the Server " .$connect['server'];
	if(!mysqli_select_db($conn,$connect['dbname'])){ 
		mysqli_close($conn);
		return "No connection to the Database";
	}	
	mysqli_close($conn);
	return "Ok";
	/*
	// Not possible because it flags error on Display!
	$mysqli_connection = new mysqli($connect['server'], $connect['dbuser'], $connect['dbpassword'],$connect['dbname']);
	if ($mysqli_connection->connect_errno) {
		//echo "Failed to connect to MySQL: (" . $mysqli_connection->connect_errno . ") " . $mysqli_connection->connect_error;
		return 'Database connection failed. ';
	}
	$mysqli_connection->close();	
	return "Ok";
	*/
}

function get_mysql_array($query,$field=NULL,$connect=NULL,$string_connection=NULL){
	 
	$data = null;
	if ($connect == NULL)
		$connect = $this->get_connect($string_connection);
	
	$mysqli_connection = new mysqli($connect['server'], $connect['dbuser'], $connect['dbpassword'],$connect['dbname']);
	if ($mysqli_connection->connect_error) {
		//echo "Failed to connect to MySQL: (" . $mysqli_connection->connect_errno . ") " . $mysqli_connection->connect_error;
		trigger_error('Database connection failed: '  . $mysqli_connection->connect_error, E_USER_ERROR);
	}else{
		$result = $mysqli_connection->query($query);
		if($result === false) {
			if ($this->debug_mode)
				$errorMessage = 'Wrong SQL: ' . $query . ' Error: ' . $mysqli_connection->error;
			else
				$errorMessage = 'Error Loading information <br> '. $mysqli_connection->error;			
			trigger_error($errorMessage, E_USER_ERROR);		
		} else {$i=1;
			while ($row = $result->fetch_assoc()) {
				if ($field==NULL)
					$data[$i]=$row;
				else 
					$data[$i]=$row[$field];
				$i++;
			}
		}
		$result->free();
	}
	$mysqli_connection->close();
	return $data;		
}

function get_mysql_line($query,$field=NULL,$connect=NULL,$string_connection=NULL){
	 
	$data = null;
	if ($connect == NULL)
		$connect = $this->get_connect($string_connection);
	
	$mysqli_connection = new mysqli($connect['server'], $connect['dbuser'], $connect['dbpassword'],$connect['dbname']);
	if ($mysqli_connection->connect_error) {
		//echo "Failed to connect to MySQL Database: <br>Error :" . $mysqli_connection->connect_errno . " - " . $mysqli_connection->connect_error;
		trigger_error('Database connection failed: '  . $mysqli_connection->connect_error, E_USER_ERROR);
	}else{
		$result = $mysqli_connection->query($query);
		if($result === false) {
			if ($this->debug_mode)
				$errorMessage = 'Wrong SQL: ' . $query . ' Error: ' . $mysqli_connection->error;
			else
				$errorMessage = 'Error Loading Information <br> '. $mysqli_connection->error;			
			trigger_error($errorMessage, E_USER_ERROR);		
		} else {
			if ($row = $result->fetch_assoc()) {
				if ($field==NULL)
					$data=$row;
				else 
					$data=$row[$field];
			}
		}
		$result->free();
	}
	$mysqli_connection->close();
	return $data;
}

function insert_mysql($query,$connect=NULL,$log=NULL,$string_connection=NULL){
	 
	$last_insert = -1;
	if ($connect == NULL)
		$connect = $this->get_connect($string_connection);
	
	$mysqli_connection = new mysqli($connect['server'], $connect['dbuser'], $connect['dbpassword'],$connect['dbname']);
	if ($mysqli_connection->connect_error) {
		//echo "Failed to connect to MySQL: (" . $mysqli_connection->connect_errno . ") " . $mysqli_connection->connect_error;
		trigger_error('Database connection failed: '  . $mysqli_connection->connect_error, E_USER_ERROR);
	}else{
		if($mysqli_connection->query($query) === false) {
		  if ($this->debug_mode)
				$errorMessage = 'Wrong SQL: ' . $query . ' Error: ' . $mysqli_connection->error;
			else
				$errorMessage = 'Error Saving Information <br> '. $mysqli_connection->error;			
			trigger_error($errorMessage, E_USER_ERROR);		
		} else {
			 $last_insert = $mysqli_connection->insert_id;
		}		
	}
	$mysqli_connection->close();
	if ($log == NULL)
		$this->save_mysql_log("Insert",$query,$connect);
	return $last_insert;
}

function update_mysql($query,$connect=NULL,$string_connection=NULL,$private=NULL){
	 
	$affected_rows = 0;
	if ($connect == NULL)
		$connect = $this->get_connect($string_connection);
	
	$mysqli_connection = new mysqli($connect['server'], $connect['dbuser'], $connect['dbpassword'],$connect['dbname']);
	if ($mysqli_connection->connect_error) {
		//echo "Failed to connect to MySQL: (" . $mysqli_connection->connect_errno . ") " . $mysqli_connection->connect_error;
		trigger_error('Database connection failed: '  . $mysqli_connection->connect_error, E_USER_ERROR);
	}else{
		if($mysqli_connection->query($query) === false) {
		  if ($this->debug_mode)
				$errorMessage = 'Wrong SQL: ' . $query . ' Error: ' . $mysqli_connection->error;
			else
				$errorMessage = 'Error Updating Information <br> '. $mysqli_connection->error;			
			trigger_error($errorMessage, E_USER_ERROR);		
		} else {
			 $result_count = $mysqli_connection->affected_rows;
		}		
	}
	$mysqli_connection->close();
	
	if (!$private){
		if ($result_count && $result_count>0)
			$this->save_mysql_log("Update",$query,$connect);
	}	
	return $result_count;
}

function non_mysql($query,$connect=NULL,$string_connection=NULL){
	 
	if ($connect == NULL)
		$connect = $this->get_connect($string_connection);
	
	$mysqli_connection = new mysqli($connect['server'], $connect['dbuser'], $connect['dbpassword'],$connect['dbname']);
	if ($mysqli_connection->connect_error) {
		//echo "Failed to connect to MySQL: (" . $mysqli_connection->connect_errno . ") " . $mysqli_connection->connect_error;
		trigger_error('Database connection failed: '  . $mysqli_connection->connect_error, E_USER_ERROR);
	}else{
		if($mysqli_connection->query($query) === false) {
		  if ($this->debug_mode)
				$errorMessage = 'Wrong SQL: ' . $query . ' Error: ' . $mysqli_connection->error;
			else
				$errorMessage = 'Error on System Statement <br> '. $mysqli_connection->error;			
			trigger_error($errorMessage, E_USER_ERROR);		
		} 	
	}
	$mysqli_connection->close();
	
	$this->save_mysql_log("None",$query,$connect);
}


function delete_mysql($query,$connect=NULL,$string_connection=NULL){
	 
	$result_count = 0;
	if ($connect == NULL)
		$connect = $this->get_connect($string_connection);
	
	$mysqli_connection = new mysqli($connect['server'], $connect['dbuser'], $connect['dbpassword'],$connect['dbname']);
	if ($mysqli_connection->connect_error) {
		//echo "Failed to connect to MySQL: (" . $mysqli_connection->connect_errno . ") " . $mysqli_connection->connect_error;
		trigger_error('Database connection failed: '  . $mysqli_connection->connect_error, E_USER_ERROR);
	}else{
		if($mysqli_connection->query($query) === false) {
		  if ($this->debug_mode)
				$errorMessage = 'Wrong SQL: ' . $query . ' Error: ' . $mysqli_connection->error;
			else
				$errorMessage = 'Error Deleting Information <br> '. $mysqli_connection->error;			
			trigger_error($errorMessage, E_USER_ERROR);		
		} else {
			 $result_count = $mysqli_connection->affected_rows;
		}		
	}
	$mysqli_connection->close();
	
	$this->save_mysql_log("Delete",$query,$connect);
	return $result_count;
}

// MYSQL UTILITIES INI

/*
CREATE TABLE `web_usr_log_sql_info` (
  `log_sql_id` int(11) NOT NULL auto_increment,
  `log_id` int(11) NOT NULL default '0',
  `user_name` varchar(100) default NULL,
  `company_name` varchar(100) default NULL,
  `requested_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `log_type` varchar(100) default NULL,
  `connection` varchar(150) default NULL,
  `query` text,
  PRIMARY KEY  (`log_sql_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
*/

function save_mysql_log($log_type,$query,$connect_log=NULL){
	 
	$last_insert = -1;
	$connect = $this->get_connect();
	
	$mysqli_connection = new mysqli($connect['server'], $connect['dbuser'], $connect['dbpassword'],$connect['dbname']);
	if ($mysqli_connection->connect_error) {
		//echo "Failed to connect to MySQL: (" . $mysqli_connection->connect_errno . ") " . $mysqli_connection->connect_error;
		trigger_error('Database connection failed: '  . $mysqli_connection->connect_error, E_USER_ERROR);
	}else{
		$log_id = isset($_SESSION['ftn_user_log_id'])?$_SESSION['ftn_user_log_id']:0;
		if (!$log_id)
			$log_id = 0;
		$query = "INSERT INTO web_usr_log_sql_info 
		  (log_id, requested_on, log_type, connection, query ) VALUES 
		  ('".$log_id."',NOW(), '$log_type',
		  '".$connect_log['server'] . " - ". $connect_log['dbname']."','". addslashes($query)."' )";
		
		if($mysqli_connection->query($query) === false) {
		  if ($this->debug_mode)
				$errorMessage = 'Wrong SQL: ' . $query . ' Error: ' . $mysqli_connection->error;
			else
				$errorMessage = 'Error Saving System Log <br> '. $mysqli_connection->error;			
			trigger_error($errorMessage, E_USER_ERROR);		
		} else {
			 //$last_insert = $mysqli_connection->insert_id;
		}		
	}
	$mysqli_connection->close();	
}

function updatefield($table,$index,$indexvalue,$field,$myvalue){
	
	$connect = $this->get_connect();
	
	$mysqli_connection = new mysqli($connect['server'], $connect['dbuser'], $connect['dbpassword'],$connect['dbname']);
	if ($mysqli_connection->connect_error) {
		//echo "Failed to connect to MySQL: (" . $mysqli_connection->connect_errno . ") " . $mysqli_connection->connect_error;
		trigger_error('Database connection failed: '  . $mysqli_connection->connect_error, E_USER_ERROR);
	}else{
		$myvalue = addslashes($myvalue);
		$query="UPDATE $table
				SET $field = '$myvalue'
				WHERE $index = '$indexvalue'"; 
		
		if($mysqli_connection->query($query) === false) {
		  if ($this->debug_mode)
				$errorMessage = 'Wrong SQL: ' . $query . ' Error: ' . $mysqli_connection->error;
			else
				$errorMessage = 'Error Updating Field <br> '. $mysqli_connection->error;			
			trigger_error($errorMessage, E_USER_ERROR);		
		} else {
			 $result_count = $mysqli_connection->affected_rows;
		}		
	}
	$mysqli_connection->close();
	return null;
}

/*
function check_database($connect=NULL){
	if (!$connect)
		$connect = $this->get_connect();
	
	$mysqli_connection = new mysqli($connect['server'], $connect['dbuser'], $connect['dbpassword'],$connect['dbname']);
	if ($mysqli_connection->connect_error) {
		//echo "Failed to connect to MySQL: (" . $mysqli_connection->connect_errno . ") " . $mysqli_connection->connect_error;
		trigger_error('Database connection failed: '  . $mysqli_connection->connect_error, E_USER_ERROR);
	}else{
		$query = "SHOW TABLES FROM ". $connect['dbname'] ;
		$result = $mysqli_connection->query($query);
		if($result === false) {
		  trigger_error('Wrong SQL: ' . $query . ' Error: ' . $mysqli_connection->error, E_USER_ERROR);
		} else {
			$i=1;
			while ($row = $result->fetch_assoc()) {
				$data[$i]=$row["Tables_in_".$connect['dbname']];
				$i++;
			}
		}
		$result->free();
	}
	$mysqli_connection->close();
	return $data;			
}
*/
// MYSQL UTILITIES END
// MYSQL FUNCTIONS END

// SQL SERVER FUNCTIONS INI

function test_sqlsrv_connect($connect) {
		//var_dump($connect);
		$ServerName = $connect['server'];
		$ConnectionInfo = array( "Database"=>$connect['dbname'], "UID"=>$connect['dbuser'], "PWD"=>$connect['dbpassword']);
		$link =  sqlsrv_connect($ServerName,$ConnectionInfo);
		if(!$link)
			return "No connection to the Server";
		sqlsrv_close($link);
		return "Ok";
}	

function get_mssql_array($query,$field=NULL,$connect=NULL,$string_connection='Edge'){
	 
	$data = null;
	if ($connect == NULL)
		$connect = $this->get_connect($string_connection);
	//var_dump($string_connection,$connect);
	
	$ServerName = $connect['server'];
	$ConnectionInfo = array( "Database"=>$connect['dbname'], "UID"=>$connect['dbuser'], "PWD"=>$connect['dbpassword']);
	$link =  sqlsrv_connect($ServerName,$ConnectionInfo);

	if($link === false){
		die(print_r(sqlsrv_errors(), true));
		//var_dump('<br>BAD<br>',$conn);	
	}else{
		//var_dump($query);
		$stmt = sqlsrv_query( $link, $query); 
		if( $stmt === false ){
			if( ($errors = sqlsrv_errors() ) != null){
				foreach( $errors as $error){
					echo "SQLSTATE: ".$error[ 'SQLSTATE']."<br>";
					echo "code: ".$error[ 'code']."<br>";
					echo "message: ".$error[ 'message']."<br>";
				}
			}
		}else{		
			$i=1;
			while( $line = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC))  
			{
				//var_dump($line,'<br>');
				if ($field==NULL)
					$data[$i]=$line;
				else 
					$data[$i]=$line[$field];
				$i++;
			}
		}
	}
	sqlsrv_free_stmt($stmt);
	sqlsrv_close($link);
	return $data;
}

function get_mssql_line($query,$field=NULL,$connect=NULL,$string_connection='Edge'){
	 
	$data = null;
	if ($connect == NULL)
		$connect = $this->get_connect($string_connection);
	//var_dump($string_connection,$connect);
	
	$ServerName = $connect['server'];
	$ConnectionInfo = array( "Database"=>$connect['dbname'], "UID"=>$connect['dbuser'], "PWD"=>$connect['dbpassword'], "ReturnDatesAsStrings"=>1);
	$link =  sqlsrv_connect($ServerName,$ConnectionInfo);

	if($link === false){
		die(print_r(sqlsrv_errors(), true));
		//var_dump('<br>BAD<br>',$conn);	
	}else{
		$stmt = sqlsrv_query( $link, $query);  
		if( $stmt === false ){
			if( ($errors = sqlsrv_errors() ) != null){
				foreach( $errors as $error) {
					echo "SQLSTATE: ".$error[ 'SQLSTATE']."<br>";
					echo "code: ".$error[ 'code']."<br>";
					echo "message: ".$error[ 'message']."<br>";
				}
			}
		}else{
		if ($line = sqlsrv_fetch_array($stmt,SQLSRV_FETCH_ASSOC)) {
					if ($field==NULL)
						$data=$line;
					else 
						$data=$line[$field];
				}else
					$data = null;
		}
	}		
	sqlsrv_free_stmt($stmt);
	sqlsrv_close($link);
	return $data;
}

function get_sqlsrv_connect($connect=NULL,$string_connection='Edge'){
	 
	$link = null;
	if ($connect == NULL)
		$connect = $this->get_connect($string_connection);
	//var_dump($string_connection,$connect);
	
	$ServerName = $connect['server'];
	$ConnectionInfo = array( "Database"=>$connect['dbname'], "UID"=>$connect['dbuser'], "PWD"=>$connect['dbpassword']);
	$link =  sqlsrv_connect($ServerName,$ConnectionInfo);

	if($link === false){
		die(print_r(sqlsrv_errors(), true));
		return NULL;
	}else{
		return $link;
	}
}

function get_sqlsrv_array($link,$query,$params,$field=NULL){
	 
	$data = null;
	if ($link){
		$stmt = sqlsrv_query( $link, $query, $params); 
		if( $stmt === false ){
			if( ($errors = sqlsrv_errors() ) != null){
				foreach( $errors as $error){
					echo "SQLSTATE: ".$error[ 'SQLSTATE']."<br>";
					echo "code: ".$error[ 'code']."<br>";
					echo "message: ".$error[ 'message']."<br>";
				}
			}
		}else{		
			$i=1;
			while( $line = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC))  
			{
				//var_dump($line,'<br>');
				if ($field==NULL)
					$data[$i]=$line;
				else 
					$data[$i]=$line[$field];
				$i++;
			}
		}
		sqlsrv_free_stmt($stmt);
		sqlsrv_close($link);
	}
	return $data;
}
// SQL SERVER FUNCTIONS END

}
?>
