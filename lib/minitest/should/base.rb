module MiniTest
  module Should
    module Base
  
      def self.included(base)
        base.extend ClassMethods
        puts "base! #{base}"
      end
      
      module ClassMethods
      
        def should(name, &block)
          method_name = [ "test_", name.gsub(/\s/, '_') ].join
          if self.test_methods.include?(method_name)
            puts "#{method_name.inspect} already exists!" 
          else
            self.send(:define_method, method_name, block)
          end
        end
              
      end
    
    end
  end
end

MiniTest::Unit::TestCase.send(:include, MiniTest::Should::Base)
