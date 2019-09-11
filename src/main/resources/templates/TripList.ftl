<html>
<head>
    <title>
        Trip List
    </title>
    <link rel="stylesheet" href="/css/timetable.css"/>
</head>
<body>
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
            <div class="subject">${trip.getDate()}</div>
        </TD>
    </TR>
    </#list>
    </TBODY>
</TABLE>
</body>
</html>

