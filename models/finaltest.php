<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of finaltest
 *
 * @author Andrew
 */
class finaltest {
    private $questionID, $equation, $solution;
    
    public function __construct($equation = '', $solution = '') {
        $this->equation = $equation;
        $this->solution = $solution;
    }
    
    function getQuestionID() {
        return $this->questionID;
    }
    
    function setQuestionID($questionID) {
        $this->questionID = $questionID;
    }
    
    function getEquation() {
        return $this->equation;
    }
    
    function setEquation() {
        $this->equation = $equation;
    }
    
    function getSolution() {
        return $this->solution;
    }
    
    function setSolution() {
        $this->solution = $solution;
    }
}
