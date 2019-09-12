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
        <a class="py-2 d-none d-md-inline-block" href="/trips">Trips</a>
        <a class="py-2 d-none d-md-inline-block" href="/profile">Profile</a>
        <a class="py-2 d-none d-md-inline-block" href="/new_driver">Add driver</a>
        <a class="py-2 d-none d-md-inline-block" href="/new_trip">Add trip</a>
        <a class="py-2 d-none d-md-inline-block" href="/admin">Support chats</a>
        <a class="py-2 d-none d-md-inline-block" href="/logout">Exit</a>
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
      Connecting...
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
          <input type="text" id="message" placeholder="Type a message..."
                 autocomplete="off" class="form-control"/>
          <button type="submit" class="primary">Send</button>
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