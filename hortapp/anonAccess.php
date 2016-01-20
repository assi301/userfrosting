<?php
require_once 'hortapp-core/hortapp.user.php';
/**
 *
 * When user access to site, this file is called from jquery, loading data for anonymous users.
 *
 **/

	echo json_encode( anonAccess() );

 ?>