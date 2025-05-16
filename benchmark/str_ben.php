<?php
    $start = microtime(true);
	$command = "/usr/bin/echo hi;";
    for ($i = 0; $i < 100; $i++) {
		$command = $command . "/usr/bin/echo hi;";
    }
	$output = shell_exec($command);
    $duration = (microtime(true) - $start) * 1000;
    echo "Duration in miliseconds: " . $duration;

    $start = microtime(true);
	$file = fopen('/tmpfs/lore', 'r');
	$lines = '';
	$haystack = '';
	if ($file) {
		while (($line = fgets($file)) !== false) {
			$haystack .= $line;
		}
		fclose($file);
	}
    $needle = 'Dignissim';
    $iter = 20_000;
    for ($i = 0; $i < $iter; $i++) {
        strpos($haystack, $needle);
    }
    $needle = 'Duis';
    for ($i = 0; $i < $iter; $i++) {
        strpos($haystack, $needle);
    }
    $duration = (microtime(true) - $start) * 1000;
    echo "Duration in miliseconds: " . $duration;
?>
