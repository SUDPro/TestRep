<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
  <title>Chat Application</title>
  <link rel="stylesheet" href="/css/chat.css" />
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
<noscript>
  <h2>Sorry! Your browser doesn't support Javascript</h2>
</noscript>
<input id="roomId" hidden value="${roomId}">
<input id="name" hidden value="Оператор">
<div id="chat-page">
  <div class="chat-container">
    <div class="chat-header">
      <h2>Chat <span id="room-id-display"></span></h2>
    </div>
    <div class="connecting">
      Соединяем...
    </div>
    <ul id="messageArea">
    <#list messages as message>
      <li class="chat-message">
        <span>${message.getSender()}</span>
        <p> ${message.getContent()} </p>
      </li>
    </#list>
    </ul>
    <form id="messageForm" name="messageForm" nameForm="messageForm">
      <div class="form-group">
        <div class="input-group clearfix">
          <input type="text" id="message" placeholder="Введите сообщение..."
                 autocomplete="off" class="form-control"/>
          <button type="submit" class="primary">Отправить</button>
        </div>
      </div>
    </form>
  </div>
</div>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script src="/webjars/js-cookie/js.cookie.js"></script>
<script src="/js/chat.js"></script>
</body>
</html>