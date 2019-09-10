<html>
<head>
    <title>
    </title>
    <link rel="stylesheet" href="/css/reg.css"/>
</head>
<body>
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