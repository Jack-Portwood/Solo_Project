require_relative('../models/artist')
require_relative('../models/exhibit')
require('pry')

Artist.delete_all()
Exhibit.delete_all()

  artist1 = Artist.new({'name' => 'David Shrigley','style' => 'Post-Mordern',
  'info' => "Went to GSA and designed Kingsley"})
  artist2 = Artist.new({'name' => 'Jamie Reid','style' => 'Décollage',
  'info' => "Made collage punk"})
  artist3 = Artist.new({'name' => 'Alan Frier Bond', 'style' => ' Minimalist',
  'info' => "The big man fae Cupar !" })

      artist1.save()
      artist2.save()
      artist3.save()

      exhibit1 = Exhibit.new({
        'title' => 'Maryhill favourate son',
        'style' => 'Post-Modern',
        'artist_id' => artist1.id,
        'info' => 'Come meet Kingsely'})

      exhibit2 = Exhibit.new({
        'title' => 'Peace is Tough',
        'style' => 'Décollage',
        'artist_id' => artist2.id,
        'info' => 'insert edgy punk band album over' })

      exhibit3 = Exhibit.new({
        'title' => 'Sausage',
        'style' => 'Post-Modern',
        'artist_id' => artist1.id,
        'info' => 'Big old Sausage'})

      exhibit4 = Exhibit.new({
          'title' => 'Views from by bedroom window',
          'style' => 'Minimalist',
          'artist_id' => artist3.id,
          'info' => 'This piece shows the concrete rendering of the build across from my room'})

 exhibit1.save
 exhibit2.save
 exhibit3.save
 exhibit4.save
