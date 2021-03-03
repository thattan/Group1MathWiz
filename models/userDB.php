<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of userDB
 *
 * @author tyler
 */
class userDB {
    
    public static function add_user($user) {
              $db = Database::getDB();

        $query = 'INSERT INTO user
                 (username, password, usertype)
              VALUES
                 (:username, :password, :usertype)';
        $statement = $db->prepare($query);
        $statement->bindValue(':username', $user->getUsername());
        $statement->bindValue(':password', $user->getPassword());
        $statement->bindValue(':usertype', $user->getUserType());
        $statement->execute();
        $statement->closeCursor();
        
        $id = $db->lastInsertId();
        return $id;  
    }
    
    public static function select_unique_username($username) {
        $db = Database::getDB();

        $queryUser = 'SELECT * FROM user
                      WHERE username = :username';
        $statement = $db->prepare($queryUser);
        $statement->bindValue(':username', $username);
        $statement->execute();
        $user = $statement->fetch();
        if ($user > 0) {
            $tempUserName = $user['username'];
        } else {
            $tempUserName = '';
        }
        $statement->closeCursor();
        return $tempUserName;
    }
    
    public static function get_user_by_id($id) {
        $db = Database::getDB();

        $query = 'SELECT * FROM user WHERE pk_id = :id';
        $statement = $db->prepare($query);
        $statement->bindValue(':id', $id);
        $statement->execute();
        $results = $statement->fetch();
        $statement->closeCursor();

        $user = new User(
                $results['username'], $results['password'],
                $results['userType']);
        $user->setId($results['pk_id']);
        return $user;
    }
    
    public static function get_user_by_username($username) {
        $db = Database::getDB();

        $query = 'SELECT * FROM user WHERE username = :username';
        $statement = $db->prepare($query);
        $statement->bindValue(':username', $username);
        $statement->execute();
        $results = $statement->fetch();
        $statement->closeCursor();

        $user = new User(
                $results['username'], $results['password'],
                $results['userType']);
        $user->setId($results['pk_id']);
        return $user;
    }
    
}
