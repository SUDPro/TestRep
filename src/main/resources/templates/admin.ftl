<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Chat Application</title>
    <link rel="stylesheet" href="/css/admin.css" />
</head>
<body>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- Page Content -->
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <table id="conversation" class="table table-striped">
                <thead>
                <tr>
                    <th>Messages</th>
                </tr>
                </thead>

                <tbody id="messages" >
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
<!-- /.container -->

<!-- Footer -->
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script src="/webjars/js-cookie/js.cookie.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/js/admin.js"></script>
</body>
</html>