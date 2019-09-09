<html>
<head>
    <title>
    </title>
    <link rel="stylesheet" href="/css/reg.css"/>
</head>
<body>
<form method="post">
    <div class="container">
        <h1>Authentication</h1>
        <hr>
        <#if error??>
            <div class="alert alert-danger">Wrong login or password!</div>
        </#if>
        <label ><b>Email</b></label>
        <input type="email" placeholder="Enter Email" name="email" required>

        <label ><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="password" required>


        <button type="submit" class="registerbtn">Register</button>
    </div>

    <div class="container signin">
        <p>Don't have an account? <a href="/reg">Registration</a>.</p>
    </div>
</form>
</body>
</html>