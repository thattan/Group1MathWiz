<?php

session_start();
date_default_timezone_set('America/Chicago');

$action = filter_input(INPUT_GET, 'action');
if ($action == null) {
    $action = filter_input(INPUT_POST, 'action');
    if ($action == null) {
        $action = 'index';
    }
}

switch ($action) {
    case 'index':
        $_SESSION['user'] = '';
        $userName = '';
        $password = '';
        $userNameError = '';
        $passwordError = '';
        include './views/login.php';
        die();
        break;
    
    case 'viewRegistration':
        $userNameError = '';
        $emailError = '';
        //$organization = New Organization();
        include './views/register.php';
        die();
        break;

    case 'login':
        $_SESSION['user'] = '';
        $username = filter_input(INPUT_POST, 'userName');
        $password = filter_input(INPUT_POST, 'password');
        $userNameError = '';
        $passwordError = '';
        $error = FALSE;
        $user = null;
        $existingUsername = '';
        if ($username === '') {
            $emailError = 'You must enter a username';
            $error = TRUE;
        }

        if ($password == '' && $_SESSION['organization'] == '') {
            $passwordError = 'You must enter a password.';
            $error = TRUE;
        }

        if ($email != '') {
            $existingEmail = OrganizationDB::select_unique_org_email($email);
        }

        if ($existingEmail != '') {
            $organization = OrganizationDB::get_organization_by_email($email);
            $oldPassword = $organization->getPassword();
            $isPassword = password_verify($password, $oldPassword);
            
            if ($isPassword == FALSE) {
                $error = TRUE;
                $emailError= "Email or Password is incorrect";
            } 

            if ($error == FALSE) {
                $_SESSION['organization'] = $organization;
                include './views/viewOrganization.php';
            } else {
                $emailError = "Cannot be found";
                include './views/login.php';
            }
        } else {
            $emailError= "Email or Password is incorrect";
            include './views/login.php';
        }
        die();
        break;

    case 'register':
        die();
        break;
}

?>