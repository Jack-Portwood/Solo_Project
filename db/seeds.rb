require_relative('../models/artist')
require_relative('../models/exhibit')
require('pry')

 Artist.delete_all()
 Exhibit.delete_all()

  artist1 = Artist.new({'name' => 'David Shrigley','style' => 'Post-Mordern',
    'info' => "something something artist"})
  artist2 = Artist.new({'name' => 'Jamie Reid','style' => 'Décollage',
    'info' => "Punk"})

  artist1.save()
  artist2.save()

 exhibit1 = Exhibit.new({
   'title' => 'Our Times',
   'style' => 'Post-Modern',
   'artist_id' => artist1.id,
   'info' => 'something something exhibit'})

 exhibit2 = Exhibit.new({
   'title' => 'Peace is Tough',
   'style' => 'Décollage',
   'artist_id' => artist1.id,
   'info' => 'something something exhibit' })

 exhibit1.save
 exhibit2.save
