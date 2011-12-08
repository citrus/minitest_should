require "minitest/unit"
require "minitest/should/base"
require "minitest/should/version"

alias :context :describe

module MiniTest
  module Should
  
    class DuplicateMethodError < StandardError; end
    
  end
end
