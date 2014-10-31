require 'bundler'
Bundler.require(:default)

require './connection'

ROOT_PATH = Dir.pwd
Dir[ROOT_PATH+"/models/*.rb"].each{ |file| require file}

Dir.glob('./{helpers,models,controllers}/*.rb').each do |file|
	require file
end

map('/users'){ run UsersController }
map('/sessions'){ run SessionsController }
map('/'){ run ApplicationController }
map('/foods'){ run FoodsController } 
map('/parties'){ run PartiesController }
map('/orders'){ run OrdersController }
map('/chefs'){ run ChefController}