require "socket"
class Client
  def initialize(server)
    @server = server
    @request = nil
    @response = nil
    send
    listen
    @request.join
    @response.join
  end

  def send
    puts "Client: Input a username"
    @request = Thread.new do
      loop do
        "asdf"
        @server.puts $stdin.gets.chomp
      end
    end
  end

  def listen
    @response = Thread.new do
      loop do
        puts @server.gets.chomp
      end
    end
  end
  #
  # def send
  #   @request = Thread.new do
  #     loop{
  #       # IO object from console input
  #       msg = $stdin.gets.chomp
  #       @server.puts( msg )
  #     }
  #   end
  # end
  #
  # def listen
  #   @response = Thread.new do
  #     loop{
  #       msg = @server.gets.chomp
  #       puts msg
  #     }
  #   end
  # end
end

server = TCPSocket.open("localhost", 3000)
c = Client.new(server)
