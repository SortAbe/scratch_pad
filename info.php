<?php
	phpinfo();
	echo 'Site can be reached.';
	echo 'Now: '. time();
	date('Y/m/d');
	throw new Exception('Tracing error for testing purposes. Not a real error.');
?>
