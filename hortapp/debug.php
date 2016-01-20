<?php


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





    echo "<strong>TEST dateToWebDMY</strong> <br>";
    $dateFromSqlDMY = "2015-03-30";
    echo "dateFromSqlDMY before: $dateFromSqlDMY <br>";
    echo "dateToWebDMY(dateFromSqlDMY): " . dateToWebDMY($dateFromSqlDMY) . "<br>";

    echo "<br>";

    echo "UN DIGIT PER A MES<br>";
    $dateFromSqlDMY = "2015-3-30";
    echo "dateFromSqlDMY before: $dateFromSqlDMY <br>";
    echo "dateToWebDMY(dateFromSqlDMY): " . dateToWebDMY($dateFromSqlDMY) . "<br>";

    echo "<br><br>";
    echo "<strong>TEST dateToSqlDMY</strong> <br>";

    $dateFromWebDMY = "30/12/2015";
    echo "dateFromWebDMY before: $dateFromWebDMY <br>" ;
    echo "dateToSqlDMY(dateFromWebDMY): " . dateToSqlDMY($dateFromWebDMY) . "<br>";
    echo "must be: 2015-12-30 <br>";

    echo "<br><br>";








    echo "<strong>TEST dateToWebDM</strong> <br>";
    $dateFromSqlDM = "2015-12-30";
    echo "dateFromSqlDM: 2015-12-30 <br>";
    echo "dateToWebDM(2015-12-30) : " . dateToWebDM($dateFromSqlDM) . "<br>";

    echo "<br>";


    $dateFromSqlDM = "2015-1-20";
    echo "dateFromSqlDM: 2015-1-20 <br>";
    echo "dateToWebDM(2015-1-20) : " . dateToWebDM($dateFromSqlDM) . "<br>";




    echo "<br><br>";

    echo "<strong>TEST dateToSqlDM</strong> <br>";
    $dateFromWebDM = "25/11";
    echo "dateFromWebDM: 25/11 <br>";
    echo "dateToSqlDM(25/11) : " . dateToSqlDM($dateFromWebDM) . "<br>";

    echo "<br>";


    $dateFromWebDM = "30/1";
    echo "dateFromWebDM: 30/1 <br>";
    echo "dateToSqlDM(30/1) : " . dateToSqlDM($dateFromWebDM) . "<br>";
    echo "must be 2015-1-30";



?>