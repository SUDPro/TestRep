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
        <a class="py-2 d-none d-md-inline-block" href="/auth">Войти</a>
        <a class="py-2 d-none d-md-inline-block" href="/reg">Регистрация</a>
    </div>
</nav>
<form method="post">
    <div class="container">
        <h1>Авторизация</h1>
        <hr>
        <#if error??>
            <div class="alert alert-danger" role="alert">
                Неверный логин или пароль!
            </div>
        </#if>
        <label><b>Email</b></label>
        <input type="email" placeholder="Введите email" name="email" required>

        <label><b>Пароль</b></label>
        <input type="password" placeholder="Введите пароль" name="password" required>


        <button type="submit" class="registerbtn">Войти</button>
    </div>

    <div class="container signin">
        <p>Нет аккаунта? <a href="/reg">Зарегистрироваться</a></p>
    </div>
</form>
</body>
</html>