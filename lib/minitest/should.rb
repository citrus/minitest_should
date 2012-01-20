require "minitest/unit"
require "minitest/should/version"

module MiniTest
  module Should  
    class DuplicateMethodError < StandardError; end    
    autoload :TestCase, "minitest/should/test_case"
  end
end
