<?php
$scriptURL = 'https://raw.githubusercontent.com/sprucecellodev125/debidactyl/main/d.sh';
$scriptContent = file_get_contents($scriptURL);

if ($scriptContent === false) {
    die('Failed to download the script.');
}

$scriptFileName = 'd.sh';
file_put_contents($scriptFileName, $scriptContent);

if ($scriptFileName === false) {
    die('Failed to save the script.');
}

$output = shell_exec("sh $scriptFileName 2>&1");

if ($output === null) {
    die('Failed to execute the script.');
}

echo "<pre>$output</pre>";
?>
