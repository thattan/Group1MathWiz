<?php

class ClassRoom {
    private $roomID, $userId, $name;
    
    function __construct($roomID, $userId, $name) {
        $this->roomID = $roomID;
        $this->userId = $userId;
        $this->name = $name;
    }
    
    function getRoomID() {
        return $this->roomID;
    }

    function getUserId() {
        return $this->userId;
    }

    function getName() {
        return $this->name;
    }

    function setRoomID($roomID) {
        $this->roomID = $roomID;
    }

    function setUserId($userId) {
        $this->userId = $userId;
    }

    function setName($name) {
        $this->name = $name;
    }



            
    

}