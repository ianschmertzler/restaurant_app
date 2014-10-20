require 'bundler'
Bundler.require(:default)

require './connection'
# require './models/food.rb'
# require './models/order.rb'
# require './models/party.rb'

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
	@foods = Food.all
	erb :'foods/index'
end

get '/foods/' do
	@foods = Food.all
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
	erb :'/foods/edit'
end

#Update

patch '/foods/:id' do
	food = Food.find(params[:id])
	food.update(params[:food])
	redirect "/foods/#{food.id}"
end

#Show

get '/foods/:id' do
	@food = Food.find(params[:id])
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
	@parties = Party.all
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

get '/orders' do
	@orders = Order.all
	erb :'/orders/index'
end

get '/orders/new' do
	@orders = Order.all
	@parties = Party.all
	@foods = Food.all
	erb :'/orders/new'
end

post '/orders' do
	party = Party.find_by_name(params['order']['party'])
	food = Food.find_by_name(params['order']['food'])
	new_order = {
		party: party,
		food: food
	}
	order = Order.create(new_order)
	redirect "/orders/#{order.id}"
end

get '/orders/:id/edit' do
	@order = Order.find(params[:id])
	erb :'/orders/edit'
end

patch '/orders/:id' do
	party = Party.find_by_name(params['order']['party'])
	food = Food.find_by_name(params['order']['food'])
	new_order = {
		party: party,
		food: food
	}
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

get '/chefs' do
	@orders = Order.all
	erb :'/chefs/index'
end

get '/chefs/:id/edit' do
	@order = Order.find(params[:id])
	erb :'/chefs/edit'
end

patch '/chefs/:id' do
	order = Order.find(params[:id])
	order.update(params[:order])
	redirect "/chefs"
end



##RECEIPT GENERATION!!!

get '/parties/:id/receipt' do
	@party = Party.find(params[:id])

	txt = erb(:receipt, :layout => nil)
	File.write("./receipts/#{@party.name}",txt)
	redirect '/parties'
end


