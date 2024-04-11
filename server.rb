require 'socket'


PASSWORD = "123123123"

server = TCPServer.new(3000)

puts "Server lightning fast at port 3000"

loop do
  client = server.accept   


  client.puts "ENTER THE PASSWORD :"
  password_attempt = client.gets.chomp

  if password_attempt == PASSWORD
    client.puts "Alohomora ¨¨ ENTER A USERNAME :"
    username = client.gets.chomp


    loop do
      message = client.gets.chomp
      puts "#{username}: #{message}"
    end
  else
    client.puts "WRONG, UR NOT ALLOWED HERE, BYE"
    client.close
  end
end
