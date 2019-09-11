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