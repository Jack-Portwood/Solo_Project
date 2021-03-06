require("minitest/autorun")
require("minitest/reporters")

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/artist.rb')
require_relative('../models/exhibit.rb')


class ArtistTest < MiniTest::Test

  def setup
    @artist1 = Artist.new({
      'name' => "Erol Simmons",
      'style'=> 'Art',
      'info' => 'Likes drawing trees',
      })
    end

    def test_name()
      result =@artist1.name
      assert_equal('Erol Simmons', result)
    end

    def test_style()
      result = @artist1.style
      assert_equal('Art', result)
    end

    def test_info()
      result = @artist1.info
      assert_equal('Likes drawing trees', result)
    end

  end
