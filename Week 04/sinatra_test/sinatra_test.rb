require 'sinatra'

#ROUTE + ACTION COMBINATIONS
get "/separating_method" do	#this is the route
	"DO THIS!" #this is the action
	referenced_method
end

#SEPARATING THE ROUTE FROM THE ACTION - this is how Rails works
def referenced_method
	#You can separate the action from the route
end

#URL FOR http://localhost:4567/hi
get "/hi" do
	"Hello world!"
end

#URL LIKE http://localhost:4567/__anything__
get "/:name/" do
	"Hello #{params[:name]}"
end

#URL LIKE: http://localhost:4567/tests?title=test&year=1991
get "/tests" do
	title = params[:title]
	year = params[:year]
	"Test: #{params[:title]}"
	"Year: #{params[:year]}"
end

#OUTPUTTING HTML using ERB templates
get "/" do
	@var = [1, 2, 3, 4, 5]
	@var2 = {
		key1: "one",
		key2: "two",
		key3: "three"
	}
	erb :index
end