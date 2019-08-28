<html>
<head>
    <title>
        Trip List
    </title>
</head>
<body>
Trips
<br>

    <#list trips as trip>
        <a href="/trip/${trip.getId()}"> ${trip.getName()}</a>
    <br>
    </#list>
</body>
</html>