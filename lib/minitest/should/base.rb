module MiniTest
  module Should
    module Base
  
      def self.included(base)
        base.extend ClassMethods
      end
      
      module ClassMethods
      
        def should(name, &block)
          method_name = [ "test_should_", name.downcase.gsub(/[^a-z0-9\_\s]+/, ' ').strip.gsub(/\s+/, "_") ].join
          if self.test_methods.include?(method_name)
            raise MiniTest::Should::DuplicateMethodError, "Test named `#{method_name}` already exists in #{self.name}." 
          else
            self.send(:define_method, method_name, block)
          end
        end
            
      end
    
    end
  end
end

MiniTest::Unit::TestCase.send(:include, MiniTest::Should::Base)
