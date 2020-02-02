require('sinatra')
require('sinatra/contrib/all')
require_relative('models/artist')
require_relative('models/exhibit')
also_reload('./models/*')



  get '/exhibits' do
    @exhibits = Exhibit.all
    erb(:index)
  end
