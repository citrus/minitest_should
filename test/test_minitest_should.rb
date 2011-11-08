gem "minitest"

require "minitest/autorun"
require "minitest/should"

class TestMiniTestShould < MiniTest::Unit::TestCase

  def test_version
    assert_equal String, MiniTest::Should::VERSION.class
  end

end
