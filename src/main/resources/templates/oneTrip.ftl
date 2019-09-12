<html>
<head>
    <title>
        Trip
    </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/timetable.css"/>
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
<div style="horiz-align: center;" class="side-bar">
    <!-- Professional Details -->
    <h1> <span> Trip: </span> ${trip.getName()}  </h1>

    <h1> <span> Driver: </span> ${trip.getDriver().getName()} </h1>

    <h1> <span> Start: </span>${trip.getStart()}</h1>

    <h1> <span> Finish: </span> ${trip.getFinish()}</h1>

    <h1> <span> Passangers: </span></h1>

<#if error??>
    <span class="alert-danger">${error}</span>
    <br>
</#if>
<form method="post">
    <button type="submit" style="color: #4CAF50" name="apply">Присоединиться</button>

    <button style="color: red" type="submit" name="decline"> Отказаться </button>
</form>
<br>
Names/ Addreses
<br>
<TABLE class="Timetable">
    <THEAD>
    <TR>
        <TH>Name</TH>
        <TH>Surname</TH>
        <TH>Birt date</TH>
    </TR>
    </THEAD>
    <TBODY>
    <#list users as user>
        <TR>
            <TD>
                <div class="subject"> ${user.getName()}</div>
            </TD>
            <TD>
                <div class="subject"> ${user.getSurname()}</div>
            </TD>
            <TD>
                <div class="subject"> ${user.getDate()}</div>
            </TD>

        </TR>
    </#list>
    </TBODY>
</TABLE>
</body>
</html>