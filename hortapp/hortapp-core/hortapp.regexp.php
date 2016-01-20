<?php 



//regular expressions
    //only alphanumeric without spaces
    $regexpAlphanumeric = array("options" => array("regexp" => "/^[a-z0-9_-]{5,15}$/"));

    //minim 6 caràcters, max 20. pot incloure . , 
    $regexpPassword = array("options" => array("regexp" => "/^[0-9A-Za-z!_\\pL@#$%*]{5,20}$/u"));
    


     ?>