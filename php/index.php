<?php
// Replace 'ls -l' with your desired shell command
$command = 'ls -l';

// Execute the command and capture its output
$output = shell_exec($command);

// Print the output
echo $output;
?>
