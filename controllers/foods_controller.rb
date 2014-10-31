class FoodsController < ApplicationController
  get '/' do
    @foods = Food.all
    erb :'foods/index'
  end


  get '/new' do
    erb :'foods/new'
  end

  #Create

  post '/' do
    food = Food.create(params[:food])
    redirect "/foods/#{food.id}"
  end

  #Edit

  get '/:id/edit' do
    @food = Food.find(params[:id])
    erb :'/foods/edit'
  end

  #Update

  patch '/:id' do
    food = Food.find(params[:id])
    food.update(params[:food])
    redirect "/foods/#{food.id}"
  end

  #Show

  get '/:id' do
    @food = Food.find(params[:id])
    erb :'/foods/show'
  end

  #Destroy

  delete '/:id' do
    Food.destroy(params[:id])
    redirect "/foods"
  end

end
