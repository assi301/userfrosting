<?php
/*======================================
=            Users register            =
======================================*/

/**
*
* Rep dades a donar d'alta via GET. Si l'usuari no existix (login o email), crea l'usuari i també el seu espai de treball de la BD
*
**/




require_once 'hortapp-core/hortapp.user.php';
require_once 'hortapp-core/hortapp.regexp.php';


$login = filter_input(INPUT_GET,'login', FILTER_VALIDATE_REGEXP, $regexpAlphanumeric);
$email = filter_input(INPUT_GET,'email', FILTER_VALIDATE_EMAIL);
$password = filter_input(INPUT_GET,'password', FILTER_VALIDATE_REGEXP, $regexpPassword);
$password2 = filter_input(INPUT_GET,'password2', FILTER_VALIDATE_REGEXP, $regexpPassword);
if (strcmp($password, $password2) == 0){      

    if ($email && $login && $password){
        switch (registerUser($login, $email, $password)) {
            case 0:
                //success
                $msg = array("success"=>true, "msg" => "Usuari registrat correctament");
                break;
            case 1:
                //login or email exists
                $msg = array("error"=>true, "msg" => "Nom d'usuari o correu electrònic ja existent");
                break;

            case 2:
                //application problem (db, etc)
                $msg = array("error"=>true, "msg" => "Problema amb el servidor");
                break;

            default:
                die ('registerUser not return [0,1,2]');
                break;
        }
    }
    else{
        $msg = array("error" => true, "msg" => "Els valors del formulari no són adequats");
    }

      

}else{
    $msg = array("error" => true, "msg" => "Les contrassenyes no coincideixen.");

}

echo json_encode($msg);

/*-----  End of Users register  ------*/

?>
 
 
