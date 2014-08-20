require "minitest/unit"
require "minitest/should/version"

module Minitest
  module Should  
    class DuplicateMethodError < StandardError; end    
    autoload :TestCase, "minitest/should/test_case"
  end
end
