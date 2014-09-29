require 'rack'

class Album
	attr_accessor :title, :year, :rank 
	def initialize()
		@title = title
		@year = year
		@rank = rank
	end

end

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
  	# Grab info from URL
  	rank_id = request.params["rank_highlight"]
  	sort_method = request.params["sort_by"]
		
		response = Rack::Response.new
		
		# create an array to load Album objects into
		result = []
		
		# Write some html TODO:load this separately, not in ruby code
		response.write("<!doctype html>\n <html>\n <head>\n </head>\n <body>\n");
		response.write("<table>\n <tr>\n <th>Rank</th>\n <th>Album</th>\n <th>Year</th>\n </tr>\n")
		
		# Open txt file and create Albums array
		File.open("top_100_albums.txt","r") do |handle|
		  handle.each_line do |line|
		    buffer =line.split(", ")
			  a = Album.new
			  a.title = buffer[0]
			  a.year = buffer[1]
			  a.rank = handle.lineno
			  result.push(a)
		  end  
		end

		# Sort the results array based on what the form returned
		if sort_method == "rank" then sort_by_rank(result)
		elsif sort_method == "year"	then sort_by_year(result)
		elsif sort_method == "name"	then sort_by_title(result)
		end 

		# Iterate through results array to display the correct table of albums
		result.each_with_index do |elem, i|
			if(elem.rank==rank_id) then response.write( "<tr class='highlighted'>\n <td>\ #{elem.rank}\ </td> <td> \ #{elem.title}\ </td>\n <td>\ #{elem.year}\ </td>\n </tr>\n")
			else response.write(" <tr>\n <td>\ #{elem.rank}\ </td> <td> \ #{elem.title}\ </td>\n <td>\ #{elem.year}\ </td>\n </tr>\n")
			end
		end

		response.write("</table>\n </body>\n</html>\n")
		response.finish
	end

	def sort_by_rank(albums)
		 albums.sort! { |a,b| a.rank <=> b.rank }
	end

	def sort_by_year(albums)
		albums.sort! { |a,b| a.year <=> b.year }
	end

	def sort_by_title(albums)
		albums.sort! { |a,b| a.title <=> b.title }
	end

	def render_404
		[404, {"Content-Type" => "text/html"}, ["Nothing here!"]]
	end
end

Rack::Handler::WEBrick.run HelloWorld.new, :Port => 8080











