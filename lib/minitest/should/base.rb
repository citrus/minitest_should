module MiniTest::Should::Base
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
  
    def should(name, &block)
      puts "name"
      method_name = [ "test_", name.gsub(/\s/, '_') ].join
      
      if self.test_methods.include?(method_name)
      
      else
      
      end
      define_method method_name, block
      puts self.test_methods
      
      
      #puts self.send(method_name)
    end
  
  end

end

MiniTest::Unit::TestCase.send(:include, MiniTest::Should)
