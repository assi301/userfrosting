<?php  

/**
*
* hortapp.getData.php
*
* Conté les funcions per a la construcció i enviament dels objectes
* usats per l'usuari en la web: l'espai de treball (enciclopedia),
* les plantilles HTML, llistats d'entitats (plantes, bancals...)
* 
**/



require_once("hortapp.lib.php");
require_once("hortapp.dbLib.php");
//require_once("paramNames.php");


/*=================================================
=            user's workspace assembly            =
=================================================*/

/**
* es construix un objecte JSON amb tota la informació que l'usuari necessita quan s'autentifica:
	* - bbdd privada
	*  - 
* els següents continguts estaran disponibles per a tots els usuaris.
* per a usuaris anònims, els formularis no tenen efecte real, pero permeten veure el funcionament
	* - formularis per a usuaris registrats 
	* - contingut html per a usuaris registrats
	* - plantilles html per a usuaris registrats
*/


function getUserWS($user){
	//declarations
	$res = array();

	//entitats:
	$res['bancal'] = getBancals($user);
	$res['parcela'] = getParceles($user);
	$res['planta'] = getPlantes($user);
	$res['familia'] = getFamilies($user);
	$res['grup'] = getGrups($user);
	$res['plaga'] = getPlagues($user);
	$res['remei'] = getRemeis($user);
	$res['tasca_fixa'] = getTasquesFixes($user);
	$res['event'] = getEvents($user);
	$res['cultiu'] = getCultius($user);
	
	
	return $res;
}

function getAnonWS(){
	return getUserWS(0);
}

/*-----  End of user's workspace assembly  ------*/


/*==============================================================
=            get HTML templates for registered user            =
==============================================================*/

/**
* Scan server directory and return HTML templates for user navigation in web application
*
* @return 	JSON 	HTML templates like $res = [ ['index', '<html> ... </html>'], ['formRegister', '<form name = ... >'] ]
*/
function getHtmlTemplates(){
	global $log;
	$paths = scandir("hortapp-html");
	$res = array();

	foreach ($paths as $key => $value) {
		if ($value !== "." && $value !== ".." && $value !== "readme"){
			$jsonIndex = substr($value, 0, -4);
			$path = "hortapp-html/" . $value;
			$res[$jsonIndex] = file_get_contents( $path);
		}
	}
	return $res;
}


/*-----  End of get HTML templates for registered user  ------*/

/*==============================================================
=            get HTML forms for registered user            =
==============================================================*/

/**
* Scan server directory and return HTML forms for user navigation in web application
*
* @return 	JSON 	HTML forms like $res = [ ['index', '<html> ... </html>'], ['formRegister', '<form name = ... >'] ]
*/
function getHtmlForms(){
	global $log;
	$paths = scandir("hortapp-forms");
	$res = array();

	foreach ($paths as $key => $value) {
		if ($value !== "." && $value !== ".." && $value !== "readme"){
			$jsonIndex = substr($value, 0, -4);
			$path = "hortapp-forms/" . $value;
			$res[$jsonIndex] = file_get_contents( $path);
		}
	}
	return $res;
}


/*-----  End of get HTML forms for registered user  ------*/



/**
* Return JSON object with all of user's bancals, with 
* -id
* -nom
* -superficie
* -ubicacio
* -detalls
* -user 
*
* @param 	int 	$user user id whose bancals will be returned
*
* @return 	JSON 	 array with bancals parameters, or error detail if fail.
*/
function getBancals($user){
	if ($user == 0){
		$conexion = dbCon(2);
	}else {
		$conexion = dbCon(1);
	}
	$res = array();

	$bancals = query_escaped($conexion, "SELECT id, nom, superficie, ubicacio, detalls, user FROM bancal WHERE user = $user");
	if (mysqli_num_rows($bancals) > 0){
		// si tens almenys 1 hort
		while ($bancal = mysqli_fetch_assoc($bancals)){

			$res[$bancal['id']] = $bancal;

		}
	}else {
		$res["error"] = "No hi ha bancals de l'usuari $user a la BBDD";
	}
	mysqli_close($conexion);
	return $res;
}




/**
* Return JSON object with all of user's parceles, with 
* -id
* -nom
* -superficie
* -ubicacio
* -detalls
* -user 
*
* @param 	int 	$user user id whose bancals will be returned
*
* @return 	JSON 	 array with bancals parameters, or error detail if fail.
*/
function getParceles($user){
	global $log;
	if ($user == 0){
		$conexion = dbCon(2);
	}else {
		$conexion = dbCon(1);
	}
	$res = array();

	$parceles = query_escaped($conexion, "SELECT id, nom, bancal, superficie, ocupada, detalls FROM parcela WHERE user = $user");
	if (mysqli_num_rows($parceles) > 0){
		// si tens almenys 1 parcela
		while ($parcela = mysqli_fetch_assoc($parceles)){
			$res[$parcela['id']] = $parcela;
		}

	}else {
		$res["error"] = "No hi ha parceles de l'usuari $user a la BBDD";
	}
	mysqli_close($conexion);
	return $res;
}


/**
* Return JSON object with all of user's plantes, with 
* - id
* - nom_comu
* - nom_cientific
* - grup
* - familia
* - marc_ample
* - marc_llarg
* - sembra
* - tasques
* - plagues
*
* @param 	int 	$user user id whose plantes will be returned
*
* @return 	JSON 	 array with plantes parameters, or error detail if fail.
*/
function getPlantes($user){
	global $log;
	if ($user == 0){
		$conexion = dbCon(2);
	}else {
		$conexion = dbCon(1);
	}
	$res = array();

	$plantes = 	query_escaped($conexion, "SELECT id, nom_comu, nom_cientific, grup, familia, sembra_ini, sembra_fi, duracio, marc_ample, marc_llarg, sembra, cultiu, collita FROM planta WHERE user = $user;");
	if (mysqli_num_rows($plantes) > 0){
		while ($planta = mysqli_fetch_assoc($plantes)){
			$res[$planta['id']] = array(
					'id' => $planta['id'],
					'nom_comu' => $planta['nom_comu'],
					'nom_cientific' => $planta['nom_cientific'],
					'grup' => $planta['grup'],
					'familia' => $planta['familia'],
					'marc_ample' => $planta['marc_ample'],
					'marc_llarg' => $planta['marc_llarg'],
					'sembra' => str_replace(array("\r", "\n"), array("\\r","\\n"),$planta['sembra']),
					'sembra_ini' => dateToWebDM($planta['sembra_ini']),
					'sembra_fi' => dateToWebDM($planta['sembra_fi']),
					'duracio' => $planta['duracio'],
					//'cultiu' => str_replace(array("\r", "\n"), array("\\r","\\n"),$planta['cultiu']),
					'cultiu' => $planta['cultiu'],
					'collita' => str_replace(array("\r", "\n"), array("\\r","\\n"),$planta['collita']),
					'tasques' => getTasquesPlanta($planta['id'], $conexion),
					'plagues' => getPlaguesPlanta($planta['id'], $conexion),	

				);
		}

	}else{
		$res["error"] = "No hi ha plantes de l'usuari $user a la BBDD";
	}
	mysqli_close($conexion);
	return $res;
}


/**
* Return JSON object with families 
* - id
* - nom
* - noms_varios
* - detalls
*
* @return 	JSON 	 array with families parameters, or error detail if fail.
*/
function getFamilies($user){
	global $log;
	if ($user == 0){
		$conexion = dbCon(2);
	}else {
		$conexion = dbCon(1);
	}
	$res = array();

	$families = query_escaped($conexion, "SELECT id, nom, noms_varios, detalls FROM familia");
	if (mysqli_num_rows($families) > 0){
		while ($familia = mysqli_fetch_assoc($families)){
			$res[$familia['id']] = $familia;
		}
		
	}else{
		$res['error'] = "No s'han recuperat families de la BBDD";
	}
	mysqli_close($conexion);
	return $res;
}


/**
* Return JSON object with grups 
* - id
* - nom
* - noms_varios
* - detalls
*
* @return 	JSON 	 array with grups parameters, or error detail if fail.
*/
function getGrups($user){
	global $log;
	if ($user == 0){
		$conexion = dbCon(2);
	}else {
		$conexion = dbCon(1);
	}
	$res = array();

	$grups = query_escaped($conexion, "SELECT id, nom, noms_varios, detalls FROM grup");
	if (mysqli_num_rows($grups) > 0){
		while ($grup = mysqli_fetch_assoc($grups)){
			$res [$grup['id']] = $grup;
		}
	}else {
		$res = array("error" => "No s'han recuperat grups de la BD");
	}
	mysqli_close($conexion);
	return $res;
}

/**
* Return JSON object with all of user's plagues, with 
* - id
* - nom_comu
* - nom_cientific
* - descripcio
* - tractament
* - remeis
* - plantes
*
* @param 	int 	$user user id whose plagues will be returned
*
* @return 	JSON 	 array with plagues parameters, or error detail if fail.
*/
function getPlagues($user){
	global $log;
	if ($user == 0){
		$conexion = dbCon(2);
	}else {
		$conexion = dbCon(1);
	}
	$consulta = "SELECT id, nom_comu, nom_cientific, descripcio, tractament FROM plaga WHERE user = $user;";
	$plagues = 	query_escaped($conexion, $consulta);
	if (mysqli_num_rows($plagues) > 0){
		$res = array();
		while ($plaga = mysqli_fetch_assoc($plagues)){
			$res[$plaga['id']] = array(
					'id' => $plaga['id'],
					'nom_comu' => $plaga['nom_comu'],
					'nom_cientific' => $plaga['nom_cientific'],
					'descripcio' => $plaga['descripcio'],
					'tractament' => $plaga['tractament'],
					'remeis' => getRemeisPlaga($plaga['id'], $conexion),
					'plantes' => getPlantesPlaga($plaga['id'], $conexion)
				);
		}

	}else{
		$res["error"] = "No hi ha plagues de l'usuari $user a la BBDD";
	}

	mysqli_close($conexion);
	return $res;	
}

/**
* Return JSON object with all of user's remeis, with 
* - id
* - nom
* - descripcio
* - preparacio
* - tasques
* - plagues
*
* @param 	int 	$user user id whose remeis will be returned
*
* @return 	JSON 	 array with remeis parameters, or error detail if fail.
*/
function getRemeis($user){
	global $log;
	if ($user == 0){
		$conexion = dbCon(2);
	}else {
		$conexion = dbCon(1);
	}
	$consulta = "SELECT id, nom, descripcio, preparacio FROM remei WHERE user = $user;";
	$remeis = query_escaped($conexion, $consulta);
	if (mysqli_num_rows($remeis) > 0){
		$res = array();
		while ($remei = mysqli_fetch_assoc($remeis)){
			$res[$remei['id']] = array(
					'id' => $remei['id'],
					'nom' => $remei['nom'],
					'descripcio' => $remei['descripcio'],
					'preparacio' => $remei['preparacio'],
					'tasques' => getTasquesRemei($remei['id'], $conexion),
					'plagues' => getPlaguesRemei($remei['id'], $conexion)
				);
		}
		
	}else{
		$res["error"] = "No hi ha remeis de l'usuari $user a la BBDD";
	}
	mysqli_close($conexion);
	return $res;
}

/**
* Return JSON object with all of user's tasques fixes, with 
* - id
* - nom
* - mes
* - descripcio
*
* @param 	int 	$user user id whose tasques fixes will be returned
*
* @return 	JSON 	 array with tasques fixes parameters, or error detail if fail.
*/
function getTasquesFixes($user){
	global $log;
	if ($user == 0){
		$conexion = dbCon(2);
	}else {
		$conexion = dbCon(1);
	}

	$tasques = query_escaped($conexion, "SELECT id, nom, mes, descripcio FROM tasca_fixa WHERE user = $user;");
	if (mysqli_num_rows($tasques) > 0){
		$res = array();
		while ($tasca = mysqli_fetch_assoc($tasques)){
			$res[$tasca['id']] = array(
					'id' => $tasca['id'],
					'nom' => $tasca['nom'],
					'mes' => $tasca['mes'],					
					'descripcio' => $tasca['descripcio']
				);
		//	$log -> write('tasca.nom -> ' . $tasca['nom']);
		//	$log -> write('tasca.descripcio -> ' . $tasca['descripcio']);
		}//fin while
	}else{
		$res["error"] = "No hi ha tasques fixes de l'usuari $user a la BBDD";
	}

	mysqli_close($conexion);
	return $res;
}

/**
* Return JSON object with all of user's events, with 
* - id
* - parcela
* - titol
* - data
* - detalls
* - realitzada
* - user
*
* @param 	int 	$user user id whose events will be returned
*
* @return 	JSON 	 array with events parameters, or error detail if fail.
*/
function getEvents($user){
	if ($user == 0){
		$conexion = dbCon(2);
	}else {
		$conexion = dbCon(1);
	}
	$res = array();

	$events = query_escaped($conexion, "SELECT id, parcela, title, start, detalls, realitzada, user FROM events WHERE user = $user;");
	if (mysqli_num_rows($events) > 0 ){
		while ($event = mysqli_fetch_array($events)){		
			$res[$event['id']] = array(
				'id' => $event['id'],
				'parcela' => $event['parcela'],
				'title' => $event ['title'],
				'start' => dateToWebDMY($event['start']),
				'detalls' => $event['detalls'],
				'realitzada' => $event['realitzada'],
				'user' => $event['user']
			);
		}
	} else {
		$res["error"] = "No hi ha events de l'usuari $user a la BBDD";
	} 

	mysqli_close($conexion);
	return $res;
}


/**
* Return JSON object with all of user's events, with 
* - id
* - parcela
* - title
* - start
* - detalls
* - realitzada
* - user
*
* @param 	int 	$user user id whose events will be returned
*
* @return 	JSON 	 array with events parameters, or error detail if fail.
*/
function getCultius($user){
	if ($user == 0){
		$conexion = dbCon(2);
	}else {
		$conexion = dbCon(1);
	}
	$res = array();

	$cultius = query_escaped($conexion, "SELECT id, planta, data_ini, data_fi, parcela, user FROM cultiu WHERE user = $user;");
	if ( mysqli_num_rows($cultius) ){
		// echo "into if";
		while ($cultiu = mysqli_fetch_array($cultius)){
			
			$data_ini = date('d/m/Y', strtotime($cultiu['data_ini']));
			$data_fi = date('d/m/Y', strtotime($cultiu['data_fi']));

			$res[$cultiu['id']] = array(
				'id' => $cultiu['id'],
				'planta' => $cultiu ['planta'],
				'data_ini' => $data_ini,
				'data_fi' => $data_fi,
				'parcela' => $cultiu['parcela']	
			);
		}
	}else {
		$res["error"] = "No hi ha cultius de l'usuari $user a la BBDD";
	}

	mysqli_close($conexion);
	return $res;

}


/*******************************************************************************/
/* getEntitiesEntitie: metodes per a obtindre entitats relacionades amb altres */

function getPlaguesPlanta($idPlanta, $conexion){
	global $log;

	$plagues = mysqli_query($conexion, "SELECT id_plaga, detalls FROM afectada WHERE id_planta = $idPlanta");
	if (mysqli_num_rows($plagues) > 0){
	    $res = array();
	    while ($plaga = mysqli_fetch_assoc($plagues)){
	        $res [$plaga['id_plaga']] = $plaga['detalls'];
	    }//fin del while
	    return $res;
	}else{
	    //$log -> write("La planta am id $idPlanta no te cap plaga associada");
	    return false;

	}
}

function getTasquesPlanta($idPlanta, $conexion){
    global $log;
    $sql = "SELECT id, nom, dies, descripcio FROM tasca_planta WHERE id_planta = " . $idPlanta . " ORDER BY dies ASC;";
    //$log -> write("getTasquesPlanta - sql : " . $sql);
    $tasques = mysqli_query($conexion, $sql);
    if (mysqli_num_rows($tasques) > 0){
        $res = array();
        while ($tasca = mysqli_fetch_assoc($tasques)){
            $res[$tasca['id']] = array(
                    'id' => $tasca['id'],
                    'nom' => $tasca['nom'],
                    'dies' => $tasca['dies'],                   
                    'descripcio' => $tasca['descripcio']
                );
        }//fin while
        return $res;
    }else{
        //$log -> write("La planta am id $idPlanta no te cap tasca associada");
        return false;
    }
}


function getPlantesPlaga($idPlaga, $conexion){
	global $log;
	$plantes = mysqli_query($conexion,"SELECT id_planta, detalls FROM afectada WHERE id_plaga = $idPlaga");
	if (mysqli_num_rows($plantes) > 0){
		$res = array();
		while ($planta = mysqli_fetch_assoc($plantes)){
			$res [$planta['id_planta']] = $planta['detalls'];
		}
		return $res;
	}else{
		return false;
	}
}

function getRemeisPlaga($idPlaga, $conexion){
	global $log;

	$remeis = mysqli_query($conexion, "SELECT id_remei, detalls FROM tractada WHERE id_plaga = $idPlaga");
	if (mysqli_num_rows($remeis) > 0){
	    $res = array();
	    while ($remei = mysqli_fetch_assoc($remeis)){
	        $res [$remei['id_remei']] = $remei['detalls'];
	    }//fin del while
	    return $res;
	}else
	    //$log -> write("La plaga am id $idPlaga no te cap renei associat");
	    
	return false;
}


function getPlaguesRemei($idRemei, $conexion){
	global $log;

	$plagues = mysqli_query($conexion,"SELECT id_plaga, detalls FROM tractada WHERE id_remei = $idRemei");

	if (mysqli_num_rows($plagues) > 0){
		$res = array();
		while ($plaga = mysqli_fetch_assoc($plagues)){
			$res[$plaga['id_plaga']] = $plaga['detalls'];
		}
		return $res;
	}else{
		return false;
	}
}

function getTasquesRemei($idRemei, $conexion){
    global $log;
    $sql = "SELECT id, nom, dies, descripcio FROM tasca_remei WHERE id_remei = " . $idRemei . " ORDER BY dies ASC;";
    $tasques = mysqli_query($conexion, $sql);
    if (mysqli_num_rows($tasques) > 0){
        $res = array();
        while ($tasca = mysqli_fetch_assoc($tasques)){
            $res[$tasca['id']] = array(
                    'id' => $tasca['id'],
                    'nom' => $tasca['nom'],
                    'dies' => $tasca['dies'],                   
                    'descripcio' => $tasca['descripcio']
                );
            //$log -> write('tasca.nom -> ' . $tasca['nom']);
            //$log -> write('tasca.descripcio -> ' . $tasca['descripcio']);
        }//fin while
        return $res;
    }else{
        //$log -> write("El remei am id $idRemei no te cap tasca associada");
        return false;
    }
}

/** deprecated */ function OLDgetPlaguesPlanta($idPlanta, $conexion){
    global $log;

    $plagues = mysqli_query($conexion, "SELECT id, nom_comu, descripcio FROM plaga WHERE EXISTS
        (SELECT * FROM afectada WHERE id_planta = $idPlanta AND id_plaga = plaga.id)");

    if (mysqli_num_rows($plagues) > 0){
        $res = array();
        while ($plaga = mysqli_fetch_assoc($plagues)){
            $res [$plaga['id']] = array(
                'id' => $plaga['id'],
                'nom_comu' => $plaga['nom_comu'],
                'descripcio' => $plaga['descripcio']
                );//fin res[]
        }//fin del while
        return $res;
    }else{
        //$log -> write("La planta am id $idPlanta no te cap plaga associada");
        return false;

    }
}

/** deprecated */ function OLDgetPlantesPlaga($idPlaga, $conexion){
    global $log;

    $plantes = mysqli_query($conexion, "SELECT id, nom_comu FROM planta WHERE EXISTS
        (SELECT * FROM afectada WHERE id_plaga = $idPlaga AND id_planta = planta.id)");

    if (mysqli_num_rows($plantes) > 0){
        $res = array();
        while ($planta = mysqli_fetch_assoc($plantes)){
            $res [$planta['id']] = array(
                'id' => $planta['id'],
                'nom_comu' => $planta['nom_comu']
                );//fin res[]
        }//fin del while
        return $res;
    }else
        //$log -> write("La plaga am id $idPlaga no te cap planta associada");
        
    return false;
}

/** deprecated */ function OLDgetRemeisPlaga($idPlaga, $conexion){
    global $log;

    $remeis = mysqli_query($conexion, "SELECT id, nom FROM remei WHERE EXISTS
        (SELECT * FROM tractada WHERE id_plaga = $idPlaga AND id_remei = remei.id)");
    if (mysqli_num_rows($remeis) > 0){
        $res = array();
        while ($remei = mysqli_fetch_assoc($remeis)){
            $res [$remei['id']] = array(
                'id' => $remei['id'],
                'nom' => $remei['nom'],
                );//fin res[]
        }//fin del while
        return $res;
    }else
        //$log -> write("La plaga am id $idPlaga no te cap renei associat");
        
    return false;
}

/** deprecated */ function OLDgetPlaguesRemei($idRemei, $conexion){
    global $log;

    $plagues = mysqli_query($conexion, "SELECT id, nom_comu FROM plaga WHERE EXISTS
        (SELECT * FROM tractada WHERE id_remei = $idRemei AND id_plaga = plaga.id)");
    if (mysqli_num_rows($plagues) > 0){
        $res = array();
        while ($plaga = mysqli_fetch_assoc($plagues)){
            $res [$plaga['id']] = array(
                'id' => $plaga['id'],
                'nom_comu' => $plaga['nom_comu'],
                );//fin res[]
        }//fin del while
        return $res;
    }else
        //$log -> write("La plaga am id $idRemei no te cap renei associat");
        
    return false;
}





?>


