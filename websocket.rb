require 'em-websocket'
require 'pp'

connections = []

EM::WebSocket.start({ host: "127.0.0.1", port: "8888" }) do |ws_conn|
  ws_conn.onopen do
    connections << ws_conn
  end

  ws_conn.onmessage do |message|
    pp message
    connections.each do |conn|
      conn.send message
    end
  end

end
