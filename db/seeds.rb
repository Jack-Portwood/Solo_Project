require_relative('../models/artist')
require_relative('../models/exhibit')


  artist1 = Artist.new({'name' => 'David Shrigley','style' => 'Post-Mordern',
    'info' => "something something artist"})
  artist2 = Artist.new({'name' => 'Jamie Reid','style' => 'Post-Mordern',
    'info' => "something something artist"})


  artist1.save
  artist2.save

 exhibit1 = Exhibit.new({
   'title' => 'Our Times',
   'style' => 'Post-Modern',
   'artist_id' => artist1.id,
   'info' => 'something something exhibit'})

 exhibit2 = Exhibit.new({
   'title' => 'More Really Great Art',
   'style' => 'Gid Art',
   'artist_id' => artist1.id,
   'info' => 'something something exhibit' })

 exhibit1.save
 exhibit2.save
