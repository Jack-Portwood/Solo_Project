require('sinatra')
require('sinatra/contrib/all')
require_relative('models/exhibit')
require_relative('models/artist')
also_reload('./models/*')
require('pry')

### exhibits

  get '/exhibits' do
    @exhibits = Exhibit.all
    erb(:exhibits)
  end

  post '/exhibits' do
    exhibit = Exhibit.new(params)
    exhibit.save
    redirect('/exhibits')
  end






##### artists
  get '/artists' do
    @exhibits = Exhibit.all
    @artists = Artist.all
    erb(:artists)
  end

  post '/artists' do
    artist = Artist.new(params)
    artist.save
    redirect('/artists')
  end








  ###Default
  get '/default' do
    @exhibits = Exhibit.all
    @artists = Artist.all
    erb(:default)
  end

  get '/default/artists_new' do
    erb(:artists_new)
  end

  get '/default/exhibits_new' do
    @artists = Artist.all()
    erb(:exhibits_new)
  end

  get '/default/artists_edit/' do
    erb(:artists_edit)
  end

  get '/default/exhibits_edit' do
    erb(:exhibits_edit)
  end

  get '/default/artists_delete' do
    erb(:artists_delete)
  end

  post '/default/:id/artists_delete' do
    artist = Artist.find(params['id'])
    artist.delete()
    redirect to '/managers'

end

  get '/default/exhibits_delete' do
    erb(:exhibits_delete)
  end

  #
  post '/default' do
    Exhibit.new(params).save
    redirect to '/exhibits'
  end

  post '/default' do
    Artist.new(params).save
    redirect to '/artists'
  end
















  get '/default/:id' do
    @artists = Artist.find(params['id'])
    erb(:default)
  end

  get '/default/:id/edit' do
    @artists = Artist.all
    @exhibits = Exhibit.all
    erb(:default)
  end

  post '/default/:id/edit' do
    artist = Artist.new(params)
    artist.update
    redirect to "/artists/#{params['id']}"
  end

  # post '/default/:id/edit' do
  #     exhibit = Exhibit.new(params)
  #     artist.update
  #     redirect to "/exhibit/#{params['id']}"
  #   end

  post '/defaut/:id/delete' do
    artist = Artist.find(params['id'])
    artist.delete
    redirect to '/artists'
  end

  # post '/defaut/:id/delete' do
  #   exhibit = Exhibit.find(params['id'])
  #   artist.delete
  #   redirect to '/exhibit'
  # end
