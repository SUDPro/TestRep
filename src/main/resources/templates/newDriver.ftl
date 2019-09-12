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
        <a class="py-2 d-none d-md-inline-block" href="/trips">Поездки</a>
        <a class="py-2 d-none d-md-inline-block" href="/profile">Профиль</a>
        <a class="py-2 d-none d-md-inline-block" href="/new_driver">Добавить водителя</a>
        <a class="py-2 d-none d-md-inline-block" href="/new_trip">Добавить поездку</a>
        <a class="py-2 d-none d-md-inline-block" href="/admin">Чаты поддержки</a>
        <a class="py-2 d-none d-md-inline-block" href="/logout">Выход</a>
    </div>
</nav>
<form method="post">
    <div class="container">
        <h1>Добавить водителя</h1>
        <hr>
        <#if errors??>
            <#list errors as error>
                <span class="alert-danger">${error}</span>
                <br>
            </#list>
        </#if>
        <label ><b>Номер водительского удостоверения</b></label>
        <input type="number" placeholder="Прим:1234292929" name="license" required>

        <label ><b>ФИО водителя</b></label>
        <input type="text" placeholder="Прим: Иванов Иван Иванович" name="name" required>


        <button type="submit" class="registerbtn">Добавить нового водителя</button>
    </div>

</form>
</body>
</html>