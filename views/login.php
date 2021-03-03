<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="main.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <div class="wrapper">

        <form action="." method="post">
            <h1>MathWiz</h1>
            <h1>Enter Login Information</h1>
            <input type="hidden" name="action" value="login" />
            <label>Username:</label>
            <input type="text" class="form-input" name="username" value="">
            <?php If ($userNameError != '') { ?>
                <p class="error"><?php echo htmlspecialchars($userNameError) ?></p>
            <?php } ?>
            <br><br>

            <label>Password:</label>
            <input type="password" class="form-input" name="password" value="">
            <?php If ($passwordError != '') { ?>
                <p class="error"><?php echo htmlspecialchars($passwordError) ?></p>
            <?php } ?>
            <br><br>

            <input type="submit" class="form-button" value="Submit">

            <br><br>
            <p><a class="link" href="index.php?action=viewRegistration">Register</a></p>
        </form>
    </div>
</body>

</html>