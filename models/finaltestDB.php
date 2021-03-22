<?php

class finaltestDB {
    public static function get_questions($questionID) {
        $db = Database::getDB();
        $query = 'SELECT * FROM additiontest ORDER BY questionID';
        $statement->execute();
        
        $questions = array();
        foreach ($statement as $row) {
            $question = new Question($row['questionID'],
                                    $row['equation'],
                                    $row['solution']);
            $questions[] = $question;
                                
        }
        return $question;
    }
}
