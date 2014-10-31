class PartiesController <ApplicationController

  get '/' do
    @parties = Party.all
    erb :'parties/index'
  end

  #Create

  post '/' do
    party = Party.create(params[:party])
    redirect "/parties/#{party.id}"
  end

  #Edit

  get '/:id/edit' do
    @party = Party.find(params[:id])
    erb :'/parties/edit'
  end

  #Update

  patch '/:id' do
    party = Party.find(params[:id])
    party.update(params[:party])
    redirect "/parties/#{party.id}"
  end

  #Show

  get '/:id' do
    @party = Party.find(params[:id])
    erb :'/parties/show'
  end

  #Delete

  delete '/:id' do
    Party.destroy(params[:id])
    redirect "/parties"
  end


get '/:id/receipt' do
  @party = Party.find(params[:id])

  txt = erb(:receipt, :layout => nil)
  File.write("./receipts/#{@party.name}",txt)
  redirect '/parties'
end

end
