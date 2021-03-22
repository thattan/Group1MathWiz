
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Assign Students</title>
    <link href="main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="wrapper"
     <h1>Select User</h1>
    <table>
        <tr>
            <th>User Name</th>
            <th>User Type</th>
            <th>&nbsp;</th>
        </tr>
        <?php foreach ($students as $student) : ?>
        <tr>
            <td><?php echo htmlspecialchars($student['username']) ; ?></td>
            <td><?php echo htmlspecialchars($student['usertype']) ; ?>?</td>
            <td><form action="." method="post">
                    <input type="hidden" name="action"
                           value="assignSelectedStudent">
                    <input type="hidden" name="pk_id"
                           value="<?php echo htmlspecialchars($student['pk_id']); ?>">
                    <input type="submit" value="Assign to Classroom">                   
                </form>              
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>
</body>


</html>

