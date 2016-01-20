<?php 

require_once("hortapp-core/hortapp.lib.php");
/**
*
* Manages HTTP user's security. check login and id integrity.
* If success, called php script runs. If fails, return error and closes ession
*
**/


/*
COSES A CONSIDERAR

iniciar sessió php
	si ha iniciat sessió a la web, tindrà un ID i un USER
		si existixen i coincidixen, deixem passar
		si no existixen o no coincideixen, tanquem sessió i informem a l'aplicació web.

	si no ha iniciat sessió a la web, no tindrà id ni use

*/
session_start();
if (isset($_SESSION['id']) && isset($_SESSION['login']) ){
	//user registered (is suposed)

	//if (exists_user($_SESSION['id'], $_SESSION['login'])){
	if (true){
		$log -> write("user " . $_SESSION['id'] . " access.");
		//user exist and OK
	}else{	
		//user id and login not exist or not correct.
		//notify server and closes session

	}
}else{
	//user not registered
	$log -> write("anonymous user access.");

	//se comenta la linea perque no és un error. seucurity.php només s'encarrega de comprovar si el id i login d'un usuari són incorrectes,
	//també deuria comprovar si la cookie phpsessid está corrupta, etc
	//$msg = array('error' => 'true', 'msg' => 'Error: sessió no iniciada');
}

//continue execution

function exists_user($id, $login){


}

?>