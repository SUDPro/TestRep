<#ftl encoding='UTF-8'>
<html>
<head>
    <title>New Trip</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
</head>
<body>
<form method="post">
    <input type="text" name="start" placeholder="start">
    <input type="text" name="finish" placeholder="finish">
    <input type="text" id="name" name="name"><br>
    <input type="text" oninput="showDriverNames(event)" id="driver" name="driver"><br>
    <div id="options">
    </div>
    <input type="text" id="date" name="date">
    <br>
    <input type="submit" value="submit">
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
            success: function(drivers) { //тут может массивчик неправильно прийти, если что пиши :3
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