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
                <a class="py-2 d-none d-md-inline-block" href="/profile">Profile</a>
                <a class="py-2 d-none d-md-inline-block" href="/new_driver">Add driver</a>
                <a class="py-2 d-none d-md-inline-block" href="/new_trip">Add trip</a>
                <a class="py-2 d-none d-md-inline-block" href="/admin">Support chats</a>
                <a class="py-2 d-none d-md-inline-block" href="/logout">Exit</a>
            </div>
</nav>
<form method="post">
    <div class="container">
        <h1>New driver</h1>
        <hr>
        <#if errors??>
            <#list errors as error>
                <span class="alert-danger">${error}</span>
                <br>
            </#list>
        </#if>
        <label ><b>Driver license</b></label>
        <input type="number" placeholder="Ex:1234292929" name="license" required>

        <label ><b>Driver name</b></label>
        <input type="text" placeholder="Ex: Ivanov Ivan Ivanovich" name="name" required>


        <button type="submit" class="registerbtn">Add new driver</button>
    </div>

</form>
</body>
</html>