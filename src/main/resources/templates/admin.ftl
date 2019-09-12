<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Chat Application</title>
    <link rel="stylesheet" href="/css/admin.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
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
<!-- Page Content -->
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <table id="conversation" class="table table-striped">
                <thead>
                <tr>
                    <th>Cообщения</th>
                </tr>
                </thead>

                <tbody id="messages">
                <#list messages as message>

                    <tr id="${message.getRoomId()}">
                        <td>
                            <form method="get">
                                <input type="hidden" name="roomId" value="${message.getRoomId()}"/>
                                <button type="submit">${message.getRoomId()}</button>
                            </form>
                        </td>
                        <td>
                            ${message.getContent()}
                        </td>
                        <td>
                            ${message.getDate()}
                        </td>
                        <td>
                            Последнее сообщ: ${message.getSender()}
                        </td>
                    </tr>

                </#list>
                </tbody>

            </table>
        </div>
    </div>
</div>

<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script src="/webjars/js-cookie/js.cookie.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/js/admin.js"></script>
</body>
</html>