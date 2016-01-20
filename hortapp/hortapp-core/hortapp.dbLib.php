<?php 

/**
*
* hortapp.dbLib.php
* 
* Contains methods for create database connections and execute queries. 
*
**/


//executes queryes escapping it, return mysql value
//substituye a mysqli_query, par aplicar escape_string y cleanSql() a totes les consultes
	/** 
	ESTE MÈTODE SUBSTITUEIX SEMPRE A mysqli_query() 
	*/
function query_escaped( $db, $sql ){
	//$sql = cleanSql($sql, $db);
	//$sql = mysqli_real_escape_string($db,$sql);
	//echo "sql -> $sql <br>";
	mysqli_query($db,"SET NAMES 'utf8'");

	$res = mysqli_query($db, $sql);

	if ($res){
		//insert correcto
		//echo "<br>query ok<br>";
		return $res;
	}else{
		//orden incorrecta
		echo mysqli_error($db);
		//echo "<br><strong>query ERROR</strong><br>";
	}
	

	return $res;



	//return mysqli_query($db,$sql);
}


//return mysqli object. for admin or user, depending on type
// 0 -> admin database ()
// 1 -> user database
// 2 -> template database (admin only)
function dbCon($type){
	//echo "type -> $type";
	if ($type == 0){
		//echo "before type 0 <br>";
		//return root dbCon 
		$link = mysqli_connect('localhost', 'hortapp', 'hortapp', 'hortapp');
		//echo "after type 0 <br>";


	}else if ($type == 1){
		//echo "before type 1 <br>";
		//return user dbCon
		$link = mysqli_connect('localhost', 'hortapp', 'hortapp', 'hortapp_user');
		//echo "after type 1 <br>";


	}else if ($type == 2){
		//echo "before type 1 <br>";
		//return user dbCon
		$link = mysqli_connect('localhost', 'hortapp', 'hortapp', 'hortapp_template');
		//echo "after type 1 <br>";


	}

	if ($link){
		//echo "conexion exitosa";
		mysqli_query($link,"SET NAMES 'utf8'");
		return $link;
	}
	else{
		//echo "conexion fallida";
		die('Connect Error (' . mysqli_connect_errno() . ') '
            . mysqli_connect_error());	
	}
}



	




?>