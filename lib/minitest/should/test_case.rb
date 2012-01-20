#!/usr/bin/ruby -w

class MiniTest::Should::TestCase < MiniTest::Spec
  
  class << self
    alias :setup :before unless defined?(Rails)
    alias :teardown :after unless defined?(Rails)
    alias :context :describe
  end
  
  def self.should(name, &block)
    method_name = [ "test_should_", name.downcase.gsub(/[^a-z0-9\_\s]+/, ' ').strip.gsub(/\s+/, "_") ].join
    if self.test_methods.include?(method_name)
      raise MiniTest::Should::DuplicateMethodError, "Test named `#{method_name}` already exists in #{self.name}." 
    else
      self.send(:define_method, method_name, block)
    end
  end
  
end
