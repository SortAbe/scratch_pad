<?php
$start = microtime(true);
$file = fopen('/tmpfs/hello', 'r');
$lines = '';
if ($file) {
    while (($line = fgets($file)) !== false) {
        echo $line;
    }
    fclose($file);
}
$duration = (microtime(true) - $start) * 1000;
echo 'Duration in mili: ' . $duration;
?>
