<html>
<head>
    <title>New Trip</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/reg.css"/>
</head>
<body>
<form method="post">
    <div class="container">
        <h1>New trip</h1>
        <hr>
        <#if errors??>
            <#list errors as error>
                <span class="alert-danger">${error}</span>
                <br>
            </#list>
        </#if>
        <label ><b>Trip</b></label>
        <input type="text" placeholder="Name" name="name" required>

        <label ><b>Start</b></label>
        <input type="text" placeholder="Start address" name="start" required>

        <label ><b>Finish</b></label>
        <input type="text" placeholder="Finish address " name="finish" required>

        <label ><b>Date</b></label>
        <input type="date" placeholder="Date" id="date" name="date" required>

        <label ><b>Driver</b></label>
        <input type="text" oninput="showDriverNames(event)" placeholder="Driver name" id="driver" name="driver" required>
        <div id="options">
        </div>

        <button type="submit" class="registerbtn">Add new trip</button>
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