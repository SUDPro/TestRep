<html>
<head>
    <title>New Trip</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
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
        <h1>Новая поездка</h1>
        <hr>
        <#if errors??>
            <#list errors as error>
                <span class="alert-danger">${error}</span>
                <br>
            </#list>
        </#if>
        <label ><b>Название</b></label>
        <input type="text" placeholder="Название" name="name" required>

        <label ><b>Старт</b></label>
        <input type="text" placeholder="Адрес начала поездки" name="start" required>

        <label ><b>Финиш</b></label>
        <input type="text" placeholder="Адрес конца поездки" name="finish" required>

        <label ><b>Дата</b></label>
        <input type="date" placeholder="Дата" id="date" name="date" required>

        <label ><b>Количество мест</b></label>
        <input type="number" placeholder="Количество мест(не более 10)" id="quota" name="quota" required>

        <label><b>Водитель</b></label>
        <input type="text" oninput="showDriverNames(event)" placeholder="Имя водителя" id="driver" name="driver" required>
        <div id="options">
        </div>

        <button type="submit" class="registerbtn">Добавить новую поездку</button>
    </div>

</form>
<script>function showDriverNames(event){
        var name = event.target.value;
        var options = document.getElementById("options");
        options.innerHTML = "";
        if (name.trim() !== "") {
            $.ajax({
                url: "/api/getDriverNames",
                method: "get",
                data: {
                    "name": name
                },
                success: function(drivers) {
                    for (var i=0; i < drivers.length; i++) {
                        var option = document.createElement("button");
                        option.onclick = selectDriver;
                        option.innerHTML = drivers[i].name;
                        options.appendChild(option);
                        options.appendChild(document.createElement("br"));
                    }
                },
                error: function(msg) {
                    alert(msg);
                }
            })
        }
    }

    function selectDriver(event) {
        document.getElementById("driver").value = event.target.innerHTML;
        document.getElementById("options").innerHTML = "";
    }
</script>
</body>
</html>