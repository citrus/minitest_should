# MiniTest Should [![Build Status](https://secure.travis-ci.org/citrus/minitest_should.png)](http://travis-ci.org/citrus/minitest_should)


Usage
-----

    gem "minitest"
    
    require "minitest/autorun"
    require "minitest/should"
    
    
    # instead of this
    class TestWithUnderscores < MiniTest::Unit::TestCase
      
      def test_should_just_work
        assert true
      end
      
    end
    
    # use this!
    class TestWithShould < MiniTest::Unit::TestCase
      
      should "just work" do
        assert true
      end
      
    end
    

 
Installation
------------

As usual, just use the `gem install` command:

    (sudo) gem install minitest_should
    
Or add wordy as a gem in your Gemfile:

    gem 'minitest_should', '~> 0.1.0' 

Then run `bundle install`



Testing
-------

Testing is done with minitest. Run the tests with:

    rake
    

License
-------

Copyright (c) 2011 Spencer Steffen & Citrus, released under the New BSD License All rights reserved.
