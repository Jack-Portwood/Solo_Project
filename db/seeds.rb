require_relative('../models/artist')
require_relative('../models/exhibit')
require('pry')

 Artist.delete_all()
 Exhibit.delete_all()

  artist1 = Artist.new({'name' => 'David Shrigley','style' => 'Post-Mordern',
    'info' => "something something artist"})
  artist2 = Artist.new({'name' => 'Jamie Reid','style' => 'Décollage',
    'info' => "Born 16 January 1947 in London, United Kingdom. Known for his anarchist connections. His work, featuring letters cut from newspaper headlines in the style of a ransom note, came close to defining the image of punk, in the UK. "})


  artist1.save
  artist2.save

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


 
