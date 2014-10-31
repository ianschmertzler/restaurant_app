class ChefController < ApplicationController

get '/' do
  @orders = Order.all
  erb :'/chefs/index'
end

get '/:id/edit' do
  @order = Order.find(params[:id])
  erb :'/chefs/edit'
end

patch '/:id' do
  order = Order.find(params[:id])
  order.update(params[:order])
  redirect "/chefs"
end


end
