require 'em-websocket'
require 'bunny'

# {comment: {id: 10, text: 'Hello', user_name: 'Jim', post_id: 3}}


WS_CONNECTIONS = []


def send_all(data)
  puts 'SEND DATA: ' + data
  WS_CONNECTIONS.each do |ws_conn|
    ws_conn.send(data)
  end
end

rmq_conn = Bunny.new
rmq_conn.start

rmq_channel = rmq_conn.create_channel

rmq_queue = rmq_channel.queue('notifications', auto_delete: true)

rmq_queue.subscribe do |delivery_info, metadata, payload|
  puts "Received #{payload}"
  send_all(payload)
end

EM.run {
  EM::WebSocket.run(:host => "0.0.0.0", :port => 8080) do |ws|
    ws.onopen { |handshake|
      WS_CONNECTIONS << ws
      puts "WebSocket connection open"

      # Access properties on the EM::WebSocket::Handshake object, e.g.
      # path, query_string, origin, headers

      # Publish message to the client
      # ws.send "Hello Client, you connected to #{handshake.path}"
    }

    ws.onclose { puts "Connection closed"; WS_CONNECTIONS.delete(ws) }

    # ws.onmessage { |msg|
    #   puts "Recieved message: #{msg}"
    #   # ws.send "Pong: #{msg}"
    #   WS_CONNECTIONS.each do |ws_conn|
    #     ws_conn.send "Pong: #{msg}"
    #   end
    # }
  end
}
