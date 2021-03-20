<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of user
 *
 * @author tyler
 */
class User {
    private $id, $username, $password, $userType;
    
    public function __construct($username = '', $password = '', $userType = '') {
        $this->username = $username;
        $this->password = $password;
        $this->userType = $userType;
    }
    
    function getId() {
        return $this->id;
    }

    function getUsername() {
        return $this->username;
    }

    function getPassword() {
        return $this->password;
    }

    function getUserType() {
        return $this->userType;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setUsername($username) {
        $this->username = $username;
    }

    function setPassword($password) {
        $this->password = $password;
    }

    function setUserType($userType) {
        $this->userType = $userType;
    }


}
