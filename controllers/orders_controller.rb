class OrdersController <ApplicationController
  get '/' do
    @orders = Order.all
    erb :'/orders/index'
  end

  get '/new' do
    @orders = Order.all
    @parties = Party.all
    @foods = Food.all
    erb :'/orders/new'
  end

  post '/' do
    party = Party.find_by_name(params['order']['party'])
    food = Food.find_by_name(params['order']['food'])
    new_order = {
      party: party,
      food: food
    }
    order = Order.create(new_order)
    redirect "/orders/#{order.id}"
  end

  get '/:id/edit' do
    @order = Order.find(params[:id])
    erb :'/orders/edit'
  end

  patch '/:id' do
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

  get '/:id' do
    @order = Order.find(params[:id])
    erb :'/orders/show'
  end

  delete '/:id' do
    Order.destroy(params[:id])
    redirect '/orders'
  end
end
