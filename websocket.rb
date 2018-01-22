require 'em-websocket'
require 'pp'
connections = []

EM::WebSocket.start({ host: "localhost", port: "8889" }) do |ws_conn|
  ws_conn.onopen do
    pp 'Websocket connection successful'
    connections << ws_conn
  end

  ws_conn.onmessage do |message|
    pp message
    connections.each do |conn|
      conn.send message
    end
  end
end
