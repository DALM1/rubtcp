require 'socket'

# Définir le mot de passe pour se connecter au serveur
PASSWORD = "123123123"

server = TCPServer.new(3000)

puts "Lightning fast at 3000 port"

loop do
  client = server.accept    # Accepter une nouvelle connexion du client

  # Demander le mot de passe à l'utilisateur
  client.puts "ENTER THE PASSWORD :"
  password_attempt = client.gets.chomp

  if password_attempt == PASSWORD
    client.puts "CORRECT PASSWORD, ENTER UR USERNAME :"
    username = client.gets.chomp
    client.puts "Welcome Wiazrd #{username} "

    # Boucle pour gérer les messages entrants de l'utilisateur
    loop do
      message = client.gets.chomp
      puts "#{username}> #{message}"
    end
  else
    client.puts "YOU ARE NOT ALLOWED HERE, BYE"
    client.close
  end
end
