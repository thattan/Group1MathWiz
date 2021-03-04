<?php
require_once 'models/database.php';
require_once 'models/userDB.php';
require_once 'models/user.php';

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
    case 'index': // initial site load
        $_SESSION['user'] = '';
        $userName = '';
        $password = '';
        $userNameError = '';
        $passwordError = '';
        include './views/login.php';
        die();
        break;
    
    case 'viewRegistration': // Goes to registration page
        $userNameError = '';
        $emailError = '';
        $user = New User();
        include './views/register.php';
        die();
        break;

    case 'login': // When logging in
        $_SESSION['user'] = '';
        $username = filter_input(INPUT_POST, 'username');
        $password = filter_input(INPUT_POST, 'password');
        $userNameError = '';
        $passwordError = '';
        $error = FALSE;
        $user = null;
        $existingUsername = '';
        if ($username === '') {
            $userNameError = 'You must enter a username';
            $error = TRUE;
        }

        if ($password == '') {
            $passwordError = 'You must enter a password.';
            $error = TRUE;
        }

        if ($username != '') {
            $existingUsername = userDB::select_unique_username($username);
        }

        if ($existingUsername != '') {
            $user = userDB::get_user_by_username($username);
            $oldPassword = $user->getPassword();
            $isPassword = password_verify($password, $oldPassword);
            
            if ($isPassword == FALSE) {
                $error = TRUE;
                $userNameError= "Username or Password is incorrect";
            } 

            if ($error == FALSE) { // SUCCESSFUL LOGIN
                $_SESSION['user'] = $user;
                if ($user->getUserType() == 'T') {
                    include './views/teacherHome.php';
                } else {
                    include './views/studentHome.php';
                }       
            } else {
                $userNameError = "Cannot be found";
                include './views/login.php';
            }
        } else {
            $userNameError= "Username or Password is incorrect";
            include './views/login.php';
        }
        die();
        break;

    case 'register': // When registering account
        $username = '';
        $password = '';
        $userType = '';
        $userNameError = '';
        $passwordError = '';
        $userTypeError = '';
        $username = filter_input(INPUT_POST, 'username');
        $password = filter_input(INPUT_POST, 'password');
        $userType = filter_input(INPUT_POST, 'userType');
        $error = false;
        
        If ($username != '') {
            $tempUserName = userDB::select_unique_username($username);
            if ($tempUserName != '') {
                $error = true;
                $userNameError = 'This is username is taken';
            }
        } else {
            $userNameError = 'Username cannot be empty';
            $error = true;
        }
        
        If ($password != '') {
            
        } else {
            $passwordError = 'Password cannot be empty';
            $error = true;
        }

        If ($userType != '') {
            
        } else {
            $userNameError = 'User Type must be chosen';
            $error = true;
        }
        
        if ($error == false) {
             $passwordHash = password_hash($password, PASSWORD_DEFAULT);
             $user = New User($username, $passwordHash, $userType);
             $userId = userDB::add_user($user);
             $user->setId($userId);
             $_SESSION['user'] = $user;
             if ($user->getUserType() == "T") {
                 include './views/teacherHome.php';
             } else {
                 include './views/studentHome.php';
             }
        } else {
            $user = New User($username, $password, $userType);
            include './views/register.php';
        }

        die();
        break;
    
    case 'finaltest':
        include './views/finaltest.php';
        die();
        break;
}

?>