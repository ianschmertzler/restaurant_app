require 'bundler'
Bundler.require(:default)
require './connection'

ROOT_PATH = Dir.pwd

Dir[ROOT_PATH+"/models/*.rb"].each{ |file| require file}


#MainMenuLink
#Index
get '/' do
	erb :index
end

#Foods Links
#Index
get '/foods' do
	@foods = Foods.all
	erb :'foods/index'
end

#New

get '/foods/new' do
	erb :'foods/new'
end

#Create

post '/foods' do
	food = Food.create(params[:food])
	redirect "/foods/#{food.id}"
end

#Edit

get '/foods/:id/edit' do
	@food = Food.find(params[:id])
	erb :'foods/edit'
end

#Update

patch '/foods/:id' do
	food = Food.find(params[:id])
	food.update(params[:food])
	redirect "/foods/#{food.id}"
end

#Show

get '/foods/:id' do
	food = Food.find(params[:id])
	erb :'/foods/show'
end

#Destroy

delete '/foods/:id' do
	Food.destroy(params[:id])
	redirect "/foods"
end

#Parties Links

#Index

get '/parties' do 
	@parties = Parties.all
	erb :'parties/index'
end

#New

get '/parties/new' do
	erb :'parties/new'
end

#Create

post '/parties' do
	party = Party.create(params[:party])
	redirect "/parties/#{party.id}"
end

#Edit

get '/parties/:id/edit' do
	@party = Party.find(params[:id])
	erb :'/parties/edit'
end

#Update

patch '/parties/:id' do
	party = Party.find(params[:id])
	party.update(params[:party])
	redirect "/parties/#{party.id}"
end

#Show

get '/parties/:id' do
	@party = Party.find(params[:id])
	erb :'/parties/show'
end

#Delete

delete '/parties/:id' do
	Party.destroy(params[:id])
	redirect "/parties"
end

#Orders Links

#Index

get '/orders' do
	erb :'/orders/index'
end

get '/orders/new' do
	erb :'/orders/new'
end

post '/orders' do
	order = Order.create(params[:order])
	redirect "/orders/#{orders.id}"
end

get '/orders/:id/edit' do
	order = Order.find(params[:id])
	erb :'/orders/edit'
end

patch '/orders/:id' do
	order = Order.find(params[:id])
	order.update(params[:order])
	redirect "/orders/#{order.id}"
end

get '/orders/:id' do
	@order = Order.find(params[:id])
	erb :'/orders/show'
end

delete '/orders/:id' do
	Order.destroy(params[:id])
	redirect '/orders'
end





