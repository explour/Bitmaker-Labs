require 'sinatra'
require_relative 'pizza.rb'

@@pizza_collection = []
@@pizza_counter = 0

get '/' do
	erb :pizza_index
end

#Shows all pizzas
get '/pizzas' do
	erb :all_pizzas
end

#Handles showing form for one pizza
get '/pizzas/new' do
	erb :pizza_new
end

#Shows one single pizza
get '/pizzas/:type' do
end

#Handles posting of new pizza
post '/pizzas' do
	@@pizza_collection[@@pizza_counter] = Pizza.new(params['type'], params['size'], params['size'])
	@@pizza_counter += 1
	erb :all_pizzas
end

#Handles showing edit form for one pizza
get '/pizzas/:type/edit' do
end
