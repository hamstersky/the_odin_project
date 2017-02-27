require 'socket'
require 'json'

server = TCPServer.open(2001)

loop do
  client = server.accept
  request = client.recv(1000)
  req_header, req_body = request.split("\r\n\r\n", 2)
  req_header = req_header.split("\r\n")
  STDERR.puts req_header[0]
  method, file, version = req_header[0].split(" ")
  path = Dir.pwd + file 

  if File.exist?(path)
    response_body = File.read(path)
    response_header = ''

    if method.downcase == 'get'
      response_header = "#{version} 200 OK\r\n" + 
                        "Content-Type: text/plain\r\n" +
                        "Content-Length: #{response_body.bytesize}\r\n" +
                        "\r\n"          
    elsif method.downcase == 'post'
      params = JSON.parse(req_body)
      response_header = "#{version} 200 OK\r\n\r\n"
      yield_data = "<li>Name: #{params['viking']['name']}</li><li>Email: #{params['viking']['email']}</li>"
      response_body.gsub!('<%= yield %>', yield_data)
    end
    client.puts response_header + response_body

  else
    client.puts "404 File Not Found"
  end
  client.close
end