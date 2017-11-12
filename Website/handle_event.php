<?php
	$withoutParentheses = substr($_POST['position'] , 1, -1);
	$coordinates = explode(',', $withoutParentheses);
	$latitude = floatval($coordinates[0]);
	$longitude = floatval($coordinates[1]);
	
	$data = "\n" . $_POST['host_name'] . "|" . $_POST['event_name'] . "|" . $_POST['location_name'] 
	. "|" . $latitude . "," . $longitude . "|" . $_POST['from_date'] . "," . $_POST['to_date'] . "|" . "|";

	//echo $data;
	file_put_contents("event_list_test.txt", $data, FILE_APPEND);
	
	
	$command = escapeshellcmd("python helloworld.py");
	$output = shell_exec($command);
	echo $output;
?>