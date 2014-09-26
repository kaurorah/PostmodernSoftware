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
		File.open("form_top.html", "rb") { |form| response.write(form.read)  }
		100.times { |i| response.write("<option value=\"#{i+1}\">#{i+1}</option>\n")}
		File.open("form_bottom.html", "rb") { |form| response.write(form.read)  }
		response.finish
	end

	def render_list(request)
		response = Rack::Response.new
		# prints 100 top albums txt to browser
		# File.open("top_100_albums.txt", "rb") { |file| response.write(file.read) }
		# read in txt file as data
		# File.open("top_100_albums.txt").readlines.each do |line|
  # 		puts line
		# end

		result = []
		response.write("<table>\n <tr>\n <th>Rank</th>\n <th>Album</th>\n <th>Year</th>\n </tr>\n")

		File.open("top_100_albums.txt","r") do |handle|
		  handle.each_line do |line|
		    result << line.split(", ")
		  end
		  
		end
		100.times do |x|
			 response.write(" <tr>\n <td>\ #{x+1}\ </td> <td> \ #{result[x][0]}\ </td>\n <td>\ #{result[x][1]}\ </td>\n </tr>\n")
		end

		response.write("</table>\n")

		response.finish
	end

	def render_404
		[404, {"Content-Type" => "text/html"}, ["Nothing here!"]]
	end
end

Rack::Handler::WEBrick.run HelloWorld.new, :Port => 8080