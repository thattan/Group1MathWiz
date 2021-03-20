<?php
class drills {
    private $drillID;
    private $skillLevel;
    private $numberOfQuestions;
    private $equation;
    private $solution;

    public function __construct($drillID, $skillLevel, $numberOfQuestions, $equation, $solution) {
        $this->drillID = $drillID;
        $this->skillLevel = $skillLevel;
        $this->numberOfQuestions = $numberOfQuestions;
        $this->equation = $equation;
        $this->solution = $solution;
    }

    public function getDrillID() {
        return $this->drillID;
    }

    public function setDrillID($value) {
        $this->drillID = $value;
    }
    
    public function getSkillLevel() {
        return $this->skillLevel;
    }

    public function setSkillLevel($value) {
        $this->skillLevel = $value;
    }
    
    public function getNumberOfQuestions() {
        return $this->numberOfQuestions;
    }

    public function setNumberOfQuestions($value) {
        $this->numberOfQuestions = $value;
    }

    public function getEquation() {
        return $this->equation;
    }

    public function setEquation($value) {
        $this->equation = $value;
    }
    
    public function getSolution() {
        return $this->solution;
    }
    
    public function setSolution($value) {
        $this->solution = $value;
    }
}