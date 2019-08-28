<html>
<head>
    <title>

    </title>
</head>
<body>
TRIP ${trip.getName()}
<br>
Driver ${trip.getDriver().getName()}
<br>
START ${trip.getStart()}
<br>
Finish ${trip.getFinish()}

<form method="post">
    <input name="apply" type="hidden">
    <input type="submit">
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