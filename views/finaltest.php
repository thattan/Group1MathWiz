<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <main>
            <h1>Final Test</h1>
            <table>
                <thead>
                    <tr>
                        <th>Question</th>
                        <th>Enter Solution:</th>
                    </tr>
                </thead>
                
                <?php foreach ($questions as $question) {?>
                
                <tbody>
                    <tr>
                        <td><?php echo $question['questionID']; ?></td>
                        <td<?php echo $question['equation']; ?></td>
                        <td></td>
                    </tr>
                </tbody>
                
            </table>
            
        </main>
    </body>
</html>
