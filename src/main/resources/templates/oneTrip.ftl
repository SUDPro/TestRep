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

<#if error??>
    <span class="alert-danger">${error}</span>
    <br>
</#if>
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