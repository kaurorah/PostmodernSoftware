require 'rack'

class HelloWorld


 	def call(env)
  	request= Rack::Request.new(env)
  	case request.path
  	when "/form" then render_form(request)
  	when "/list" then render_list(request)
  	else render_404
		end
	end

	def render_form(request)
		response=Rack::Response.new
		File.open("index.html", "rb") { |form| response.write(form.read)  }
		response.finish
	end

	def render_list(request)
		response = Rack::Response.new
		response.finish
	end

	def render_404
		[404, {"Content-Type" => "text/html"}, ["Nothing here!"]]
	end
end

Rack::Handler::WEBrick.run HelloWorld.new, :Port => 8080