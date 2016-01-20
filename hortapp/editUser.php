 <?php

 /*====================================
 =            edit users            =
 ====================================*/
 
 /**
 *
 * Rep dades de l'usuari via $_GET. Les valida, i les passa a editUser() de hortapp.user.php per a l'actualització de les dades.
 * Requerix el password antic per a fer qualsevol canvi.
 **/

require_once 'hortapp-core/hortapp.user.php';
require_once 'hortapp-core/hortapp.regexp.php';

$login = filter_input(INPUT_GET,'login', FILTER_VALIDATE_REGEXP, $regexpAlphanumeric);
//echo "login: $login";
$password = filter_input(INPUT_GET,'password', FILTER_VALIDATE_REGEXP, $regexpPassword);
//echo "password: $password";
$newPasword = filter_input(INPUT_GET,'newPasword', FILTER_VALIDATE_REGEXP, $regexpAlphanumeric);
//echo "newPasword: $newPasword";
$newPasword2 = filter_input(INPUT_GET,'newPasword2', FILTER_VALIDATE_REGEXP, $regexpAlphanumeric);
//echo "newPasword2: $newPasword2";
$email = filter_input(INPUT_GET,'email', FILTER_VALIDATE_REGEXP, $regexpAlphanumeric);
//echo "email: $email";

if ($password){
    $msg = array();
    if (strcmp($newPassword, $newPassword2) == 0){      
        $res = editUser($login, $password, $newPasword, $email);
        if (is_array($res)){
            //success
            $msg = $res;
            $msg['success'] = true;
        }else{
            switch ($res) {
                case 0:
                    $msg = array('success' => 'Dades actualitzades correctament' );
                    break;

                case 1:
                    $msg = array('error' => 'Actualització no realitzada. Intenta-ho més endavant' );
                    break;

                case 2:
                    $msg = array('error' => 'Error amb la BD' );
                    break;  
                             
                default:
                    die ('editUser() return unknown result code');
                    break;
            }
        }
    } else {
        $msg = array('error' => 'Nova contrassenya no coincident');
    }
}else{
    $msg = array('error' => 'Contrassenya no indicada' );
}

//$msg[] = array("userLogin"=>"$login");

echo  json_encode($msg);

?> 