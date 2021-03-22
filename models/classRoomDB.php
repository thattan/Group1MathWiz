<?php

class ClassRoomDB {
    public static function add_room($classRoom){
            $db = Database::getDB();
         
       $query = ' INSERT INTO classRoom (userID, name)'
               . 'VALUES (:userID, :name)';
       $statement = $db->prepare($query);
       $statement->bindValue(':userID', $classRoom->getUserID());
       $statement->bindValue(':name', $classRoom->getName());
       $statement->execute();
       $statement->closeCursor();
       
       $id = $db->lastInsertId();
       return $id;
    }
    
    public static function get_all_users(){
        $db = Database::getDB();
        
        $query = 'SELECT * FROM user';
        $statement = $db->prepare($query);
        $statement->execute();
        $results = $statement->fetchAll();
        $statement->closeCursor();
        
        return $results;                
    }
}