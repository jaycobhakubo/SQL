<?php

class db_connection
{
	//ADD this user to MYSQL 
		//$connect['dbpassword']="dkc408a1f";
		//$connect['dbpassword']="dkc408a1f";
		//$connect['dbpassword']="dkcF2v2yjx408A1f";
				//$connect['dbpassword']="dkc$08A1f";	
				
	function get_system_connect(){   
		$connect['server']="localhost";
        $connect['dbname']="ftn_seats";
		$connect['dbuser']="root";
		$connect['dbpassword']="root";		
		return $connect;
}

	
function get_system_connect_local(){   
			$connect['server']="localhost";
        $connect['dbname']="ftn_seats";
		$connect['dbuser']="root";
		$connect['dbpassword']="root";		
		return $connect;

} 
function get_casino_connect(){   
		$connect['server']="localhost";
        $connect['dbname']="ftn_seats";
		$connect['dbuser']="root";
		$connect['dbpassword']="root";		
		return $connect;
} 
function get_bingostar_connect(){   
		$connect['server']="localhost";
        $connect['dbname']="ftn_seats";
		$connect['dbuser']="root";
		$connect['dbpassword']="root";		
		
		return $connect;
	
}



 
}
?>
