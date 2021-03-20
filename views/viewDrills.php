<?php
require_once'../model/drills.php';
require_once'../model/drillsDB.php';
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Select Type of Drill</title>
    </head>
    <body>
        <div id="navigation">
                <label>&nbsp;</label>
                <a href="../views/viewAdditionDrills.php">Addition Drills</a>
                <br>
                <label>&nbsp;</label>
                <a href="../views/viewSubtractionDrills.php">Subtraction Drills</a>
                <br>
                <label>&nbsp;</label>
                <a href="../views/viewMultiplicationDrills.php">Multiplication Drills</a>
                <br>
                <label>&nbsp;</label>
                <a href="../views/viewDivisionDrills.php">Division Drills</a>
                <br>
                
                <?php
                //Only Teachers should be able to see this option and they can view the other drills too to fimaliarize themselves
                ?>
                <label>&nbsp;</label>
                <a href="../views/viewCreateDrills.php">Create Drills</a>
        </div>
    </body>
</html>
