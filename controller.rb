require('sinatra')
require('sinatra/contrib/all')
require_relative('models/exhibit')
require_relative('models/artist')
also_reload('./models/*')



  get '/exhibits' do
    @exhibits = Exhibit.all
    erb(:index)
  end

  get '/exhibits/new' do
    @artists = Artist.all
    erb(:new)
  end
