# TODO: definitely find a better way of dealing with the html and css than in the ruby file

require 'rack'
require 'sqlite3'

class Album
	attr_accessor :title, :year, :rank 
	# def initialize(title, year, rank)
	# 	@title = title
	# 	@year = year
	# 	@rank = rank
	# end
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
  	rank_id = request.params["rank_highlight"].to_i
  	sort_method = request.params["sort_by"]
		
		response = Rack::Response.new
		
		# Create an array to load Album objects into
		result = []
		
		response.write("<!doctype html>\n <html>\n <head>\n	<style type=\"text/css\"> .highlighted {background: yellow;}</style> </head>\n <body>\n");
		response.write("<table>\n <tr>\n 	<th>Rank</th>\n <th>Album</th>\n <th>Year</th>\n </tr>\n")
		
		# Instantiate a new database object
		albums_database = SQLite3::Database.new("albums.sqlite3.db")
		
		# Load database into an array
		albums_array = albums_database.execute("SELECT * FROM albums")

		#Iterate through array, create Album objects from database, push to results array
		albums_array.each do |id, title, year, rank|
			 a = Album.new
			 a.title=title
			 a.year=year			 
			 a.rank=rank
			 result.push(a)
		end
		
		# Sort the results array based on what the form returned		
		 sort_by(result, sort_method)

		# # Iterate through results array to display the correct table of albums
		result.each_with_index do |elem, i|
			if(elem.rank==rank_id) then response.write( "<tr class=\"highlighted\">\n <td>\ #{elem.rank}\ </td> <td> \ #{elem.title}\ </td>\n <td>\ #{elem.year}\ </td>\n </tr>\n")
			else response.write(" <tr>\n 	<td>\ #{elem.rank}\ </td> <td> \ #{elem.title}\ </td>\n 	<td>\ #{elem.year}\ </td>\n </tr>\n")
			end
		end
		response.write("</table>\n </body>\n</html>\n")
		response.finish
	end

	def sort_by(collection, attr)
		collection.sort! { |a,b| a.send(attr) <=> b.send(attr)}
	end

	def render_404
		[404, {"Content-Type" => "text/html"}, ["Nothing here!"]]
	end
end

Rack::Handler::WEBrick.run HelloWorld.new, :Port => 8080











