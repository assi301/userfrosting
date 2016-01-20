<?php

require_once 'hortapp.dbLib.php';
require_once 'hortapp.getData.php';

/**
* USER FUNCTIONS
* Contains functions for user mangement. Register, edit, resetPassword, login, logout, remove user
*/

/**
* Receive validated login, email and password and generates user in DB. Also generates all rows from template wich will be user workspace. 
*
* @param 	string 	$login 		user's login
* @param 	string 	$email 		user's email
* @param 	string 	$password 	user's password
*
* @return 	int 	0: success, 1: error (user or email exists), 2: database connection error
*/
function registerUser ($login, $email, $password){
	$return = 2;
	//var_dump(dbCon(0));
	//get connection to db
	if ($dbAdmin = dbCon(0)){

		//check if user exists
		$exists = query_escaped($dbAdmin, "SELECT id FROM user WHERE login = '$login' OR email = '$email' LIMIT 1;");
		if (mysqli_num_rows($exists) == 1){
			$return = 1;
		} else {
			//user don't exist and connection OK, register user

	        $pas = hash('sha256', mysqli_real_escape_string($dbAdmin, $password));

			if (query_escaped($dbAdmin, "INSERT INTO user (email, login, password) VALUES ('$email', '$login', '$pas')")){
				//insert user OK
				$userId = mysqli_insert_id($dbAdmin);
				
				if ($dbTemplate = dbCon(2)){
					//copiar files de l'espai d'usuari a la BD
					$copyQueries = "INSERT INTO hortapp_user.planta (id, nom_comu, nom_cientific, grup, familia, sembra_ini, sembra_fi, marc_ample, marc_llarg, produccio, sembra, cultiu, collita, user) SELECT  planta.id, planta.nom_comu, planta.nom_cientific, planta.grup, planta.familia, planta.sembra_ini, planta.sembra_fi, planta.marc_ample, planta.marc_llarg, planta.produccio, planta.sembra, planta.cultiu, planta.collita, $userId FROM planta; INSERT INTO hortapp_user.plaga (id, nom_comu, nom_cientific, descripcio, tractament, user) SELECT plaga.id, plaga.nom_comu, plaga.nom_cientific, plaga.descripcio, plaga.tractament, $userId FROM plaga; INSERT INTO hortapp_user.remei (id, nom, descripcio, preparacio, user) SELECT remei.id, remei.nom, remei.descripcio, remei.preparacio, $userId FROM remei; INSERT INTO hortapp_user.afectada ( id_planta, id_plaga, detalls, user) SELECT afectada.id_planta ,afectada.id_plaga ,afectada.detalls ,$userId  FROM afectada; INSERT INTO hortapp_user.tractada ( id_plaga, id_remei, descripcio, user) SELECT  tractada.id_plaga, tractada.id_remei, tractada.descripcio, $userId FROM tractada; INSERT INTO hortapp_user.img_bancal ( id_foto, id_bancal, titol, detalls, user) SELECT  img_bancal.id_foto, img_bancal.id_bancal, img_bancal.titol, img_bancal.detalls, $userId FROM img_bancal; INSERT INTO hortapp_user.img_plaga ( id_foto, id_plaga, titol, detalls, user) SELECT img_plaga.id_foto,img_plaga.id_plaga,img_plaga.titol,img_plaga.detalls, $userId FROM img_plaga; INSERT INTO hortapp_user.img_planta ( id_foto, id_planta, titol, detalls, user) SELECT img_planta.id_foto,img_planta.id_planta,img_planta.titol,img_planta.detalls, $userId FROM img_planta; INSERT INTO hortapp_user.tasca_fixa ( mes, nom, descripcio, user) SELECT  tasca_fixa.mes, tasca_fixa.nom, tasca_fixa.descripcio, $userId FROM tasca_fixa; INSERT INTO hortapp_user.tasca_planta ( id_planta, nom, dies, descripcio, user) SELECT  tasca_planta.id_planta, tasca_planta.nom, tasca_planta.dies, tasca_planta.descripcio, $userId FROM tasca_planta; INSERT INTO hortapp_user.tasca_remei ( id_remei, nom, dies, descripcio, user) SELECT  tasca_remei.id_remei, tasca_remei.nom, tasca_remei.dies, tasca_remei.descripcio, $userId FROM tasca_remei;";
					$copyQueries = explode(";", $copyQueries);
					foreach ($copyQueries as $key => $query) {
						if (!strcmp($query, "") == 0){
							query_escaped($dbTemplate, $query);
						}
					}
					
					//arreglar referències entre files
					if ($dbUser = dbCon(1)){

						//arregla plantes
						$plantes = query_escaped($dbUser, "SELECT id FROM planta WHERE user = $userId");
						while ($planta = mysqli_fetch_assoc($plantes)){
							$oldId = $planta['id'];

							//insert planta 1
						 	if (!query_escaped($dbUser, "INSERT INTO planta (nom_comu, nom_cientific, grup, familia, sembra_ini, sembra_fi, marc_ample, marc_llarg, produccio, sembra, cultiu, collita, user) SELECT planta.nom_comu, planta.nom_cientific, planta.grup, planta.familia, planta.sembra_ini, planta.sembra_fi, planta.marc_ample, planta.marc_llarg, planta.produccio, planta.sembra, planta.cultiu, planta.collita, planta.user FROM planta WHERE id = $oldId;")){
						 		//ERROR:
						 		echo "can't duplicate planta to get new id";
						 	}
						 	//capturem ID
						 	$newId = mysqli_insert_id($dbUser);
						 	
						 	//taules a actualitzar
						 	$tablesToUpdate = array("img_planta", "tasca_planta", "afectada");
						 	foreach ($tablesToUpdate as $key => $table) {
						 		if (!query_escaped($dbUser, "UPDATE $table SET id_planta = $newId WHERE id_planta = $oldId;")){
						 			//cannot update table $table
						 			echo "<br>can't upddate table $table <br>";
						 			die ("can't update table");
						 		}

						 	}

							//eliminem fila antiga

							if (!query_escaped($dbUser, "DELETE FROM planta WHERE id = $oldId")){
								//ERROR
								echo "cannot delete old planta";
							}
						}//fin while (planta = mysqlfetcasoc(plantes))

						//arregla plagues
						$plagues = query_escaped($dbUser, "SELECT id FROM plaga WHERE user = $userId");
						while ($plaga = mysqli_fetch_assoc($plagues)){
							$oldId = $plaga['id'];

							//insert plaga 1
						 	if (!query_escaped($dbUser, "INSERT INTO plaga (nom_comu, nom_cientific, descripcio, tractament, user) SELECT plaga.nom_comu, plaga.nom_cientific, plaga.descripcio, plaga.tractament, plaga.user FROM plaga WHERE id = $oldId;")){
						 		//ERROR:
						 		echo "can't duplicate plaga to get new id";
						 	}
						 	//capturem ID
						 	$newId = mysqli_insert_id($dbUser);
						 	
						 	//taules a actualitzar
						 	$tablesToUpdate = array("img_plaga", "tractada", "afectada");
						 	foreach ($tablesToUpdate as $key => $table) {
						 		if (!query_escaped($dbUser, "UPDATE $table SET id_plaga = $newId WHERE id_plaga = $oldId;")){
						 			//cannot update table $table
						 			echo "<br>can't upddate table $table <br>";
						 			die ("can't update table");
						 		}

						 	}

							//eliminem fila antiga

							if (!query_escaped($dbUser, "DELETE FROM plaga WHERE id = $oldId")){
								//ERROR
								echo "cannot delete old plaga";
							}
						}//fin while (plaga = mysqlfetcasoc(plantes))

						//arregla remeis
						$remeis = query_escaped($dbUser, "SELECT id FROM remei WHERE user = $userId");
						while ($remei = mysqli_fetch_assoc($remeis)){
							$oldId = $remei['id'];

							//insert remei 1
						 	if (!query_escaped($dbUser, "INSERT INTO remei (nom, descripcio, preparacio, user) SELECT remei.nom, remei.descripcio, remei.preparacio, remei.user FROM remei WHERE id = $oldId;")){
						 		//ERROR:
						 		echo "can't duplicate remei to get new id";
						 	}
						 	//capturem ID
						 	$newId = mysqli_insert_id($dbUser);
						 	
						 	//taules a actualitzar
						 	$tablesToUpdate = array( "tasca_remei", "tractada");
						 	foreach ($tablesToUpdate as $key => $table) {
						 		if (!query_escaped($dbUser, "UPDATE $table SET id_remei = $newId WHERE id_remei = $oldId;")){
						 			//cannot update table $table
						 			echo "<br>can't upddate table $table <br>";
						 			die ("can't update table");
						 		}

						 	}

							//eliminem fila antiga

							if (!query_escaped($dbUser, "DELETE FROM remei WHERE id = $oldId")){
								//ERROR
								echo "cannot delete old remei";
							}
						}//fin while (remei = mysqlfetcasoc(remeis))
						

						mysqli_close($dbUser);

						//fin arreglo files noves

						$return = 0; //success!
					}

					//enviar dades al correu de l'usuari

				}			
			}else {
				$return = 2;
			}
		}
	}
	mysqli_close($dbAdmin);
	return $return;
}


/**
* Receive validated parameters updates in DB. All parameters have value.
*
* @param 	string 	$login 		new user's login
* @param 	string 	$email 		new user's email
* @param 	string 	$password 	new user's password
*
* @return 	int 	0: success, 1: update error, 2: database connection error
*/
function editUser($user, $login, $password, $newPasword, $email){

	if ($dbAdmin = dbCon(0)){
		
		$newPassHash = hash('sha256', mysqli_real_escape_string($dbAdmin, $newPasword));
		$passHash = hash('sha256', mysqli_real_escape_string($dbAdmin, $password));

		$sql = "UPDATE user SET (login, email, password) VALUES ($login, $email, $newPassHash) 
		WHERE id = $user AND password = $passHash;";

		if (query_escaped($dbAdmin, $sql)){
			$return = 0; //success
		}else {
			$return = 1; //error updating
		}
		//if query is TRUE, changes done successfully
		mysqli_close($dbAdmin);
		
	}else{
		$return = 2; //error connecting database
	}
	return $return;
}


/**
* Receive validated login, resets user's password, and emailed it to user.
*
* @param 	string 	$login 		new user's login
*
* @return 	int 	0: success, 1: error (login don't exists), 2: (error) database connection 
*/
function resetPassword($login, $email){
	/**
	TO-DO
	crida a editUser amb
	args: 'id'
	*/
}


/**
* Receive validated old login, and new email, password and updates in DB. If new parameters are null, don't update it. 
*
* @param 	string 	$oldLogin 	Old login for user's locate.
* @param 	string 	$login 		new user's login
* @param 	string 	$email 		new user's email
* @param 	string 	$password 	new user's password
*
* @return 	int 	0: success, 1: error (oldLogin don't exists), 2: (error) database connection 
*/
function removeUser($login, $password){
	$return = -1;  //error not captured
	/**
	
		TODO:
		- AFEGIT PASSWORD ALS PARÀMETRES PASSATS. FALTA comprovar si el password es correspon en la primera consulta
	**/
	
	if ($dbAdmin = dbCon(0)){
		//test if users exists
		$exists = query_escaped($dbAdmin, "SELECT id FROM user WHERE login = '$login' LIMIT 1;");
		if (mysqli_num_rows($exists) == 1){
			//USER EXISTS
			if (!$dbUser = dbCon(1))
				return -2; //error conectant amb BD d'usuari
			//ELIMINA FILES DE HORTAP_USER
			$dropUserWorkspace = "DELETE FROM planta WHERE user = $userId; DELETE FROM plaga WHERE user = $userId; DELETE FROM remei WHERE user = $userId; DELETE FROM img_bancal WHERE user = $userId; DELETE FROM tasca_fixa WHERE user = $userId;";
			$dropUserWorkspace = explode(";", $dropUserWorkspace);
			foreach ($dropUserWorkspace as $key => $query) {
				if (!strcmp($query, "") == 0);
					query_escaped($dbUser, $query);
			}

			//ELIMINA USUARI DE hortapp
			$dropUser = "DELETE FROM user WHERE id = $userid"; 
			query_escaped($dbUser, $query);
			$return = 0;//success

		} else {
			$return = -2;//USER NOT EXISTS
		}
		mysqli_close($dbAdmin);
	}else{
		$return = -2; //error connectant amb la bd de l'aplicació
	}
	return $return;
}


/**
* Receive validated and password and check it on DB. If success, set $_SESSION parameters and send user's workspace
*
* @param 	string 	$login 		new user's login
* @param 	string 	$password 	new user's password
*
* @return 	int|array 	if success, array with user's workspace. If error, returns [-4, -1]
*/
function login($login, $password){
	$return = -1; //error not captured

	if ($dbAdmin = dbCon(0)){
		$pas = hash('sha256', mysqli_real_escape_string($dbAdmin, $password));
		$exists = query_escaped($dbAdmin, "SELECT id, login FROM user WHERE login = '$login' AND password = '$pas' LIMIT 1;");
		if (mysqli_num_rows($exists) == 1){
			$user = mysqli_fetch_assoc($exists);

		
			if (isset($_SESSION['login'])){
				
				//error session already started
				$return = -4;

			}else {
				$_SESSION['login'] = $user['login'];
				$_SESSION['id'] = $user['id'];
		
				$return = getUserWS($user['id']); //success login
			}
			
		}else{
			$return = -3; //usuari o contrassenya incorrectes o no existents a la BD
		}
		mysqli_close($dbAdmin);
	}else{
		$return = -2; //error dbCon
	}

	return $return;
}


/**
* This function is called when user visitor access to website.
* Provides html templates for navigation and entities template for demo purpouses.
* 
* @return 	array 	Array with demo entities and html templates for webpage.
*/
function anonAccess(){
	//html templates
	$res = array();
	$res['html'] = getHtmlTemplates();
	$res['forms'] = getHtmlForms();
	//databse content
	$res['entities'] = getAnonWS();
	$res['success'] = true;

	return $res;
}


?>