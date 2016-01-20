<?php 

require_once "security.php";
require_once 'hortapp-core/hortapp.user.php';


	session_destroy();
	$log -> write("Sessió destruida");
	$msg = array('success' => 'true', 'msg' => 'Sessió tancada correctament');

	//$msg['ws'] = anonAccess();
	//no cal perque desde jquery es crida a windows.location, recridant a index.php (amb el include a hortapp.js,
	//que carrega la informació per a usuaris anònims) i recarregant la pàgina

echo json_encode($msg);


?>