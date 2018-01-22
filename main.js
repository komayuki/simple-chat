(function(){
  var ws = new WebSocket('ws://localhost:8889/')
  var msg = document.getElementById('message')
  var btn = document.getElementById('btn')
  var messages = document.getElementById('messages')
  btn.addEventListener('click', function () {
    ws.send(msg.value);
  })

  ws.onmessage = function(event){
    var div = document.createElement('li')
    div.textContent = event.data
    messages.appendChild(div)
  };
})()
