require('sinatra')
require('sinatra/contrib/all')
require_relative('models/exhibit')
require_relative('models/artist')
also_reload('./models/*')
require('pry')



 get '/' do
   @exhibits = Exhibit.all
   @artists = Artist.all
   erb(:"visitors/index")
 end

 get '/artists/:id' do
   @artist = Artist.find(params['id'])
   erb(:"visitors/vartists")
 end

 # post '/default/exhibits/:id/delete' do
 #   exhibit = Exhibit.find(params['id'])
 #   exhibit.delete()
 #   redirect to '/exhibits'
 # end




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

  post '/default/exhibits/:id/delete' do
    exhibit = Exhibit.find(params['id'])
    exhibit.delete()
    redirect to '/exhibits'
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



  get '/default/artists_edit/:id' do
    @artist = Artist.find(params[:id].to_i)
    erb(:artists_edit)
  end

  post '/default/artists_edit/:id' do
    updated_artist = Artist.new(params)
    updated_artist.update
    redirect to '/default'
  end

  post '/default/artists/:id/delete' do
    artist = Artist.find(params['id'])
    artist.delete()
    redirect to '/artists'
  end





  get '/default/exhibits_edit/:id' do
    @artists = Artist.all
    @exhibit = Exhibit.find(params[:id].to_i)
    erb(:exhibits_edit)
  end

  post '/default/exhibits_edit/:id' do
    Exhibit.new(params).update
    redirect to '/exhibits'
  end




  #
  # post '/default' do
  #   Exhibit.new(params).save
  #   redirect to '/exhibits'
  # end
  #
  # post '/default' do
  #   Artist.new(params).save
  #   redirect to '/artists'
  # end
