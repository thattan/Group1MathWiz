<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link href="main.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <div class="wrapper">

        <form action="." method="post">
            <h1>MathWiz</h1>
            <h1>Registration Information</h1>
            <input type="hidden" name="action" value="register" />
            <label>Username:</label>
            <input type="text" class="form-input" name="username" value="">
            <br><br>

            <label>Password:</label>
            <input type="password" class="form-input" name="password" value="">
            <br><br>

            <label>User Type</label><br>
            <input type="radio" id="teacher" name="userType" value="T">
            <label>Teacher</label><br>
            <input type="radio" id="student" name="userType" value="S">
            <label>Student</label>
            <br><br>

            <input type="submit" class="form-button" value="Register">

            <br><br>
            <p><a class="link" href="index.php?action=index">Sign In</a></p>
        </form>
    </div>
</body>

</html>