<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Division Drills</title>
    </head>
    <body>
        <main>
            <div id="formWrapper">
            <h1>Division drills available</h1><br>
            <nav>
                <table>
                    <thead>
                        <tr>
                            <th>Drill</th>
                            <th>Skill Level</th>
                            <th>Number of Questions</th>
                            <th>Equation</th>
                            <th>Solution</th>
                        </tr>
                    </thead>
                    
                    <?php foreach ($allDrills as $drill) {?>
                    
                <tbody>
                    <tr>    
                        <td><?php echo $drill['drillID']; ?></td>
                      <td><?php echo $drill['skillLevel']; ?></td>     
                      <td><?php echo $drill['numberOfQuestions']; ?></td> 
                      <td><?php echo $drill['equation']; ?></td> 
                      <td><?php echo $drill['solution']; ?></td> 
                    </tr><?php } ?> 
                </tbody>
                </table>
            </nav>
            </div>
        </main>
</html>
