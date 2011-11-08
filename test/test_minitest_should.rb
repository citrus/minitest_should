gem "minitest"

require "minitest/autorun"
require "minitest/should"
begin; require "turn"; rescue LoadError; end

class TestMiniTestShould < MiniTest::Unit::TestCase

  def setup
    @something = "nothing"
  end
  
  def nothing
    "blank"
  end

  def test_version
    assert_equal String, MiniTest::Should::VERSION.class
  end
  
  def test_includes_minitest_should_base_module
    assert self.class.included_modules.include?(MiniTest::Should::Base)
  end
  
  def test_respond_to_should
    assert self.class.respond_to?(:should)
  end
  
  should "just work" do
    assert true
  end
  
  should "create method from string" do
    assert self.class.test_methods.include?("test_should_create_method_from_string")
  end
  
  should "work with multiple assertions" do
    assert_block do 
      1 == 2 / 2
    end
    assert_raises NameError do
      zomg
    end
    assert_instance_of String, "woo hoo"
    assert_equal 2, 1 + 1    
  end
  
  should "work with the tests instance variables" do
    assert_equal "nothing", @something
  end
  
  should "work with the tests instance methods" do
    assert_equal "blank", nothing
  end
  
  def test_should_warn_on_duplicate_method_names
    assert_raises MiniTest::Should::DuplicateMethodError do
      self.class.send(:should, "warn on duplicate method names") do
        assert true
      end
    end  
  end  
  
  should "also warn on duplicate method names" do
    assert_raises MiniTest::Should::DuplicateMethodError do 
      self.class.send(:should, "also warn on duplicate method names") do
        assert true
      end
    end 
  end
      
end
