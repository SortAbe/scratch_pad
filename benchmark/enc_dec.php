<?php
$path = '1MB.json';
$jsonString = file_get_contents($path);
$jsonData = json_decode($jsonString, true);
$start = microtime(True);
$stuff = json_encode($jsonData);
echo microtime(True) - $start . "\n";
?>
