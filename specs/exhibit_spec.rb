require("minitest/autorun")
require("minitest/reporters")

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../exhibit')
require_relative('../artist')

class ExhibitTest < MiniTest::Test

  def setup
    @
