<?php

/**
*
* hortapp.lib.php
* 
* llibreria de mètodes per a l'aplicació. 
*
* nota: Els mètodes de bbdd estan en hortapp.dbLib.php
**/


/**
*
* Log class
*
**/
    class Log{
        public function write ($strData){
            $file = "/var/www/html/hortapp-webv0.2/log/hortapp.log";
            //echo realpath($file);
            if (!is_writable($file))
                die('No puede abrirse el fichero de log');

            $handle = fopen($file, 'a+');

            $logLine = "\r" . date('D, d M Y H:i:s') . "\t" 
            . $_SERVER['SCRIPT_NAME'] . "\t" . $strData;

            fwrite ($handle, $logLine);
            fclose($handle);
        }

        public function read ($file){

        }
    }
    $log = new Log();



/**
* date functions
*/

    /** 
    * com el format de data del mysql (YYYY/MM/DD hh:mm) és invers al que estem acostumats (dd/mm/yyyy)
    * totes les dates que passen de la BD a l'usuari, o de l'usuari a la BD; han de ser formatejades correctament
    *
    * format MYSQL: 2015-12-31
    *
    * format WEB: 31/12/2015
    *
    */
    function dateToWebDMY($d){
        return date("d/m/Y",strtotime($d));
    }

    function dateToSqlDMY($d){
        return date_format(date_create_from_format('d/m/Y',$d),'Y-m-d');
    }

    /**
    * el rang de dates per a sembrar una planta es guarda com a 2000-mes-dia
    * s'ha triat l'any 2000 per consistència (totes les dates de sembra_ini i sembra_fi
    * tenen el mateix any en la data)
    *
    * php -> js
    * l'any s'ignora a l'enviar-lo a l'aplicació, que rep sembra_ini com a dia/mes.
    * des de JS s'especifica l'any actual per a saber si és moment de sembrar
    *
    * js -> php
    * l'aplicació js envia la data com a dia/mes, i php s'encarrega d'assignar-li
    * l'any 2000 per a inserir-lo a la web 
    */
    function dateToWebDM($d){
        return date("d/m",strtotime($d));
    }

    function dateToSqlDM($d){
        return date_format(date_create_from_format('d/m',$d),'Y-m-d');
    }



?>