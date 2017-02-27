require 'socket'
require 'json'

host = 'localhost'
port = 2001

puts "What type of request you want to send: GET or POST"
type = gets.chomp

if type.downcase == 'get'
  request = "GET /index.html HTTP/1.1\r\n"
elsif type.downcase == 'post'
  puts "Give the viking a name: "
  name = gets.chomp
  puts "What's the viking's email?"
  email = gets.chomp
  params = {}
  params[:viking] = { name: name, email: email }
  body = params.to_json
  request = "POST /thanks.html HTTP/1.1\r\n" + 
            "Content-Length: #{body.bytesize}\r\n" + 
            "\r\n" + 
            body
else
  puts "405 Method not allowed"
end
socket = TCPSocket.open(host, port)
socket.print(request)
response = socket.read
headers, body = response.split("\r\n\r\n", 2)
print body