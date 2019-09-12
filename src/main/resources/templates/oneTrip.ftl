<html>
<head>
    <title>
        Trip
    </title>
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
TRIP ${trip.getName()}
<br>
Driver ${trip.getDriver().getName()}
<br>
START ${trip.getStart()}
<br>
Finish ${trip.getFinish()}

<#if error??>
    <span class="alert-danger">${error}</span>
    <br>
</#if>
<form method="post">
    <input type="submit" style="color: #4CAF50" name="apply" placeholder="Присоединиться"/>

    <input style="color: red" type="submit" name="decline" placeholder="Отказаться"/>
</form>
<br>
Names/ Addreses
<br>
<#list users as user>
    ${user.getName()} / ${user.getAddress()}
    <br>
</#list>


</body>
</html>