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
            <a class="py-2 d-none d-md-inline-block" href="/trips">Поездки</a>
            <a class="py-2 d-none d-md-inline-block" href="/auth">Войти</a>
            <a class="py-2 d-none d-md-inline-block" href="/reg">Регистрация</a>
        </div>
    </#if>
</nav>
<form method="post">
    <div class="container">
        <h1>Регистрация</h1>
        <hr>
        <#if error??>
            <div class="alert alert-danger" role="alert">
                ${error}
            </div>
        </#if>
        <label ><b>Имя</b></label>
        <input type="text" placeholder="Введите имя" name="name" required>

        <label ><b>Фамилия</b></label>
        <input type="text" placeholder="Введите фамилию" name="surname" required>

        <label ><b>Email</b></label>
        <input type="email" placeholder="Введите еmail" name="email" required>

        <label ><b>Пароль</b></label>
        <input type="password" placeholder="Введите пароль" name="password" required>

        <label ><b>Дата рождения</b></label>
        <input type="date" placeholder="Введите дату рождения" name="date" required>

        <label ><b>Адрес</b></label>
        <input type="text" placeholder="Введите полный адрес. Прим: Казань, ул. Пушкина, 28" name="address" required>


        <button type="submit" class="registerbtn">Зарегистрироваться</button>
    </div>

    <div class="container signin">
        <p>У вас уже есть аккаунт? <a href="/auth">Войти</a>.</p>
    </div>
</form>
</body>
</html>