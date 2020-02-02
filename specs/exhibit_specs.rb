require("minitest/autorun")
require("minitest/reporters")

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../exhibit')
require_relative('../artist')

class ExhibitTest < MiniTest::Test

  def setup
    @exhibit1 = exhibit.new({
      'title' => 'artz',
      'style'=> 'Art',
      'info' => 'Likes drawing trees',
      'artist_id'  1
      })
    end

    def test_title()
      result = @exhibit1.title
      assert_equal('artz', result)
    end

    def test_style()
      result = @exhibit1.test_style
      assert_equal('Art', result)
    end

    def test_info()
      result = @exhibit1.info
      assert_equal('Likes drawing trees', result)
    end

      def test_artist_id()
      result = @artist1.artist_id
      assert_equal(1,result)
     end
   end
