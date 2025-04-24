require 'webrick'
require 'erb'

class GameServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    template = ERB.new(File.read('game.html.erb'))
    response.status = 200
    response['Content-Type'] = 'text/html'
    response.body = template.result
  end
end

server = WEBrick::HTTPServer.new(Port: 3000)
server.mount '/', GameServlet

trap('INT') { server.shutdown }
server.start 