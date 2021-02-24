<?php

session_start();
date_default_timezone_set('America/Chicago');

$action = filter_input(INPUT_GET, 'action');
if ($action == null) {
    $action = filter_input(INPUT_POST, 'action');
    if ($action == null) {
        $action = 'test';
    }
}

switch ($action) {
    case 'test':
        include './views/test.php';
        die();
        break;
}

?>