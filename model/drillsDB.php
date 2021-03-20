<?php
class drillsDB {
    
    public static function getAdditionDrills() {
        $db = Database::getDB();
        $query = 'SELECT * FROM additiondrills
                  ORDER BY drillID';
        $statement = $db->prepare($query);
        $statement->execute();
        
        $drills = array();
        foreach ($statement as $row) {
            $drill = new Drill($row['drillID'],
                                     $row['numberOfQuestions'],
                                     $row['skillLevel'],
                                     $row['solution'],
                                     $row['equation']);
            $drills[] = $drill;
        }
        return $drill;
    }
    
    public static function getSubtractionDrills() {
        $db = Database::getDB();
        $query = 'SELECT * FROM subtractiondrills
                  ORDER BY drillID';
        $statement = $db->prepare($query);
        $statement->execute();
        
        $drills = array();
        foreach ($statement as $row) {
            $drill = new Drill($row['drillID'],
                                     $row['numberOfQuestions'],
                                     $row['skillLevel'],
                                     $row['solution'],
                                     $row['equation']);
            $drills[] = $drill;
        }
        return $drill;
    }
    
    public static function getDivisionDrills() {
        $db = Database::getDB();
        $query = 'SELECT * FROM divisiondrills
                  ORDER BY drillID';
        $statement = $db->prepare($query);
        $statement->execute();
        
        $drills = array();
        foreach ($statement as $row) {
            $drill = new Drill($row['drillID'],
                                     $row['numberOfQuestions'],
                                     $row['skillLevel'],
                                     $row['solution'],
                                     $row['equation']);
            $drills[] = $drill;
        }
        return $drill;
    }
    
    public static function getMultiplicationDrills() {
        $db = Database::getDB();
        $query = 'SELECT * FROM multiplicationdrills
                  ORDER BY drillID';
        $statement = $db->prepare($query);
        $statement->execute();
        
        $drills = array();
        foreach ($statement as $row) {
            $drill = new Drill($row['drillID'],
                                     $row['numberOfQuestions'],
                                     $row['skillLevel'],
                                     $row['solution'],
                                     $row['equation']);
            $drills[] = $drill;
        }
        return $drill;
    }
    
    public static function getCustomDrills() {
        $db = Database::getDB();
        $query = 'SELECT * FROM customdrills
                  ORDER BY drillID';
        $statement = $db->prepare($query);
        $statement->execute();
        
        $drills = array();
        foreach ($statement as $row) {
            $drill = new Drill($row['drillID'],
                                     $row['numberOfQuestions'],
                                     $row['skillLevel'],
                                     $row['solution'],
                                     $row['equation']);
            $drills[] = $drill;
        }
        return $drill;
    }

    public static function getDrills($drillID) {
        $db = Database::getDB();
        $query = 'SELECT * FROM drills
                  WHERE consoleID = :consoleID';    
        $statement = $db->prepare($query);
        $statement->bindValue('drillID = drillID', $drillID);
        $statement->execute();    
        $row = $statement->fetch();
        $statement->closeCursor();    
        $drill = new Drill($row['drillID'],
                                     $row['numberOfQuestions'],
                                     $row['skillLevel'],
                                     $row['solution'],
                                     $row['equation']);
        return $drill;
    }
}
