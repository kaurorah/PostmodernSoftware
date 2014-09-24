require 'rack'


class HelloWorld


  def call(env)
  	file = File.open("index.html", "r")
	contents=file.read 
    [200, {"Content-Type" => "text/html"}, [contents]]
  end
end

Rack::Handler::WEBrick.run HelloWorld.new, :Port => 8080