gem "minitest"

begin; require "simplecov"; SimpleCov.start; rescue LoadError; end
begin; require "turn"; rescue LoadError; end

require "minitest/autorun"
require "minitest/should"

class TestMiniTestShould < MiniTest::Should::TestCase

  def setup
    @something = "nothing"
  end
  
  def nothing
    "blank"
  end

  def test_version
    assert_equal String, MiniTest::Should::VERSION.class
  end
  
  def test_case_extends_minitest_unit_test_case
    assert self.class.ancestors.include?(MiniTest::Unit::TestCase)
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
  
  should "allow-crazy! @characters..." do
    assert self.class.test_methods.include?("test_should_allow_crazy_characters")
  end
  
  should "4 * 4 = 12" do #deadmau5
    assert self.class.test_methods.include?("test_should_4_4_12")
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
  
  context "one little alias" do
    
    should "make this true" do
      assert true
    end
    
    should "work with the parent tests instance variables" do
      assert_equal "nothing", @something
    end
    
    should "work with the parent tests instance methods" do
      assert_equal "blank", nothing
    end    
      
    context "with a another context" do
            
      setup do
        @something = "not-nothing"
      end
      
      teardown do
        assert "not-nothing", @something
      end
            
      should "just keep on keepin' on" do
        assert true
      end
      
      should "manipulate the parent tests instance variables in setup" do
        assert_equal "not-nothing", @something
      end
      
    end
    
    context "with the same method names as another context" do
      
      should "just work" do
        assert true
      end
      
      should "just keep on keepin' on" do
        assert true
      end
      
    end
      
  end
  
end
