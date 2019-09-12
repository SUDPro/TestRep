<html>
<head>
    <title>
        Trip List
    </title>
    <link rel="stylesheet" href="/css/timetable.css"/>
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
<H1>Timetable</H1>
<TABLE class="myTimetable">
    <THEAD>
    <TR>
        <TH>Name</TH>
        <TH>Start</TH>
        <TH>Finish</TH>
        <TH>Driver</TH>
        <TH>Date</TH>
    </TR>
    </THEAD>
    <TBODY>
    <#list trips as trip>
        <TR>
            <TD>
                <div class="subject"><a href="/trip/${trip.getId()}"> ${trip.getName()}</a></div>
            </TD>
            <TD>
                <div class="subject">${trip.getStart()}</div>
            </TD>
            <TD>
                <div class="subject">${trip.getFinish()}</div>
            </TD>
            <TD>
                <div class="subject">${trip.getDriver().getName()}</div>
            </TD>
            <TD>
                <div class="subject">${trip.getDate()} 7:00</div>
            </TD>
        </TR>
    </#list>
    </TBODY>
</TABLE>
</body>
</html>

