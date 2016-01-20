 <?php

 /*====================================
 =            User's login            =
 ====================================*/
 
 /**
 *
 * Rep dades de l'usuari via $_GET, Si es un usuari vàlid, torna html 
 * per a usuaris registrats i espai de treball de l'usuari de la BD
 *
 **/
require_once 'security.php';
require_once 'hortapp-core/hortapp.user.php';
require_once 'hortapp-core/hortapp.regexp.php';

$login = filter_input(INPUT_GET,'login', FILTER_VALIDATE_REGEXP, $regexpAlphanumeric);
//echo "login: $login";
$password = filter_input(INPUT_GET,'password', FILTER_VALIDATE_REGEXP, $regexpPassword);
//echo "password: $password";

if ($login && $password){
    $msg = array();

    $res = login($login, $password);
    if (is_array($res)){
        //success
        $msg = $res;

        //$log -> write("before: " . var_dump($msg));
        $msg['success'] = true;
        //$log -> write("after: " . var_dump($msg));

    }else{
        switch ($res) {
            case -5:
                $msg = array('error' => 'case-4', 'msg' => 'No es pot iniciar sessió.' );
                break;

            case -4:
                $msg = array('error' => 'case-4', 'msg' => 'Sessió ja iniciada' );
                break;

            case -3:
                $msg = array('error' => 'case -3', 'msg' => 'Usuari i/o contrassenya no vàlids!' );
                break;  
            
            case -2:
                $msg = array('error' => 'case -2', 'msg' => 'Error amb la BD' );
                break;  
            
            case -1:
                $msg = array('error' => 'case -1', 'msg' => 'Error not captured');
                break;  
            
            default:
                die ('login return unknown result code');
                break;
        }
    }
}else{
    $msg = array('error' => 'true', 'msg'=> 'Login i/o contrassenya no vàlids' );
}

//$msg[] = array("userLogin"=>"$login");

echo  json_encode($msg);

?> 