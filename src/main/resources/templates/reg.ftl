<html>
<head>
    <title>
    </title>
    <link rel="stylesheet" href="/css/reg.css"/>
</head>
<body>
<form method="post">
    <div class="container">
        <h1>Register</h1>
        <p>Please fill in this form to create an account.</p>
        <hr>

        <label ><b>Name</b></label>
        <input type="text" placeholder="Enter Name" name="name" required>

        <label ><b>Surname</b></label>
        <input type="text" placeholder="Enter Surname" name="surname" required>

        <label ><b>Email</b></label>
        <input type="email" placeholder="Enter Email" name="email" required>

        <label ><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="password" required>

        <label ><b>Address</b></label>
        <input type="text" placeholder="Enter full address. Ex: Kazan, Pushkina st, 28" name="address" required>


        <button type="submit" class="registerbtn">Register</button>
    </div>

    <div class="container signin">
        <p>Already have an account? <a href="/auth">Sign in</a>.</p>
    </div>
</form>
</body>
</html>