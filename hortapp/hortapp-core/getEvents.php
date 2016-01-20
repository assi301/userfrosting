<?php 

require_once 'hortapp.dbLib.php';
require_once 'hortapp.events.utils.php';
// Short-circuit if the client did not give us a date range.
if (!isset($_POST['start']) || !isset($_POST['end'])) {
	die("Please provide a date range.");
}

$range_start = parseDateTime($_POST['start']);
$range_end = parseDateTime($_POST['end']);


$conexion = dbCon(2);
$res = array();

// sleep(1000);
$sql = "SELECT * FROM events WHERE user = ". $_POST['user'] . "";


/**
*****************************************************************

to-do: add WHERE start > request.start AND start < request.end

start: 2015-05-06
request.start: 2015-05-31
request.end: 2015-07-12

formats compatibles!?
****************************************************************/
if ($events = query_escaped($conexion, $sql)){
	// echo "into if";
	while ($event = mysqli_fetch_array($events)){
		$event = new Event($event);
		
		if ($event->isWithinDayRange($range_start, $range_end)) {
			$res[] = $event->toArray();
		}

	}
}

echo json_encode($res);


?>