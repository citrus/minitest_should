# MiniTest Should [![Build Status](https://secure.travis-ci.org/citrus/minitest_should.png)](http://travis-ci.org/citrus/minitest_should)

minitest_should allows you to write unit tests with [shoulda](https://github.com/thoughtbot/shoulda) style context syntax for minitest.

------------------------------------------------------------------------------
Usage
------------------------------------------------------------------------------

When writing your mini-tests, inherit from `MiniTest::Should::TestCase`.


```ruby
gem "minitest"

require "minitest/autorun"
require "minitest/should"


# instead of this
class TestWithUnderscores < MiniTest::Unit::TestCase
  
  def test_should_just_work
    assert true
  end
  
  def test_something_else_should_be_nothing
    @something = "nothing"
    assert_equal "nothing", @something
  end
  
end

# use this!
class TestWithShould < MiniTest::Should::TestCase
  
  should "just work" do
    assert true
  end
  
  context "Something else" do
    
    setup do
      @something = "nothing"
    end
    
    should "be nothing" do
      assert_equal "nothing", @something
    end
    
  end
  
end
```

------------------------------------------------------------------------------
Installation
------------------------------------------------------------------------------

As usual, just use the `gem install` command:

```bash
(sudo) gem install minitest_should
```
    
Or add minitest_should as a gem in your Gemfile:

```bash
gem 'minitest_should', '~> 0.3.1' 
```

Run `bundle install` then require minitest_should like so:

```ruby
require "minitest/autorun"
require "minitest/should"
```

Make sure your test classes inherit from `MiniTest::Should::TestCase`

```ruby
class MyTest < MiniTest::Should::TestCase

  # ...

end
```


------------------------------------------------------------------------------
Testing
------------------------------------------------------------------------------

Testing is done with minitest. (duh!) Run the tests with:

```bash
rake
```
    

------------------------------------------------------------------------------
Changelog
------------------------------------------------------------------------------

**2012/1/26 - v0.3.1**

- always alias setup to before, even if rails is present


**2012/1/20 - v0.3.0**

- don't pollute minitest/unit/testcase
- subclass minitest/spec as minitest/should/test_case
- alias before and after as setup and teardown


**2011/12/8 - v0.2.0**

- add contexts


**2011/11/8 - v0.1.1**

- ensure dynamic methods have safe names


**2011/11/8 - v0.1.0**

- it exists!
  
    
------------------------------------------------------------------------------
License
------------------------------------------------------------------------------

Copyright (c) 2011 - 2012 Spencer Steffen & Citrus, released under the New BSD License All rights reserved.
