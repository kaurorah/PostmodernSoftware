require 'rack'
require 'sqlite3'

class Album
	attr_accessor :title, :year, :rank 
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
		response.write(ERB.new(File.read("form.html.erb")).result(binding))
		response.finish
	end


	def render_list(request)
  	# Grab info from URL
  	rank_id = request.params["rank_highlight"].to_i
  	sort_method = request.params["sort_by"]
		
		response = Rack::Response.new
		
		# Create an array to load Album objects into
		result = []
		
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
		
		# Print out list through ERB file
		response.write(ERB.new(File.read("list.html.erb")).result(binding))

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











