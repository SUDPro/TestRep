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
    <#if user??>
        <#if user.getRole() == "STUDENT">
            <div class="container d-flex flex-column flex-md-row justify-content-between">
                <a class="py-2 d-none d-md-inline-block" href="/trips">Trips</a>
                <a class="py-2 d-none d-md-inline-block" href="/profile">Profile</a>
                <a class="py-2 d-none d-md-inline-block" href="/logout">Exit</a>
            </div>
        </#if>
        <#if user.getRole() == "ADMIN">
            <div class="container d-flex flex-column flex-md-row justify-content-between">
                <a class="py-2 d-none d-md-inline-block" href="/trips">Trips</a>
                <a class="py-2 d-none d-md-inline-block" href="/profile">Profile</a>
                <a class="py-2 d-none d-md-inline-block" href="/new_driver">Add driver</a>
                <a class="py-2 d-none d-md-inline-block" href="/new_trip">Add trip</a>
                <a class="py-2 d-none d-md-inline-block" href="/admin">Support chats</a>
                <a class="py-2 d-none d-md-inline-block" href="/logout">Exit</a>
            </div>
        </#if>
    <#else>
        <div class="container d-flex flex-column flex-md-row justify-content-between">
            <a class="py-2 d-none d-md-inline-block" href="/trips">Trips</a>
            <a class="py-2 d-none d-md-inline-block" href="/auth">Sign in</a>
            <a class="py-2 d-none d-md-inline-block" href="/reg">Registration</a>
        </div>
    </#if>
</nav>
<form method="post">
    <div class="container">
        <h1>Register</h1>
        <p>Please fill in this form to create an account.</p>
        <hr>
        <#if error??>
            <div class="alert alert-danger" role="alert">
                ${error}
            </div>
        </#if>
        <label ><b>Name</b></label>
        <input type="text" placeholder="Enter Name" name="name" required>

        <label ><b>Surname</b></label>
        <input type="text" placeholder="Enter Surname" name="surname" required>

        <label ><b>Email</b></label>
        <input type="email" placeholder="Enter Email" name="email" required>

        <label ><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="password" required>

        <label ><b>Birth</b></label>
        <input type="date" placeholder="Enter Password" name="date" required>

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