<html>
<head>
    <title>
    </title>
    <link rel="stylesheet" href="/css/reg.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<nav class="site-header sticky-top py-1" style="background: #f1f1f1 !important;">
        <div class="container d-flex flex-column flex-md-row justify-content-between">
            <a class="py-2 d-none d-md-inline-block" href="/trips">Trips</a>
            <a class="py-2 d-none d-md-inline-block" href="/auth">Sign in</a>
            <a class="py-2 d-none d-md-inline-block" href="/reg">Registration</a>
        </div>
</nav>
<form method="post">
    <div class="container">
        <h1>Authentication</h1>
        <hr>
        <#if error??>
            <div class="alert alert-danger" role="alert">
                Wrong login or password!
            </div>
        </#if>
        <label><b>Email</b></label>
        <input type="email" placeholder="Enter Email" name="email" required>

        <label><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="password" required>


        <button type="submit" class="registerbtn">Register</button>
    </div>

    <div class="container signin">
        <p>Don't have an account? <a href="/reg">Registration</a>.</p>
    </div>
</form>
</body>
</html>