#!/usr/bin/ruby -w

class Minitest::Should::TestCase < Minitest::Spec  
  class << self
    alias :setup :before
    alias :teardown :after
    alias :context :describe
  end
  
  def self.should(name, &block)
    method_name = [ "test_should_", name.downcase.gsub(/[^a-z0-9\_\s]+/, ' ').strip.gsub(/\s+/, "_") ].join
    if self.method_defined?(method_name)
      raise Minitest::Should::DuplicateMethodError, "Test named `#{method_name}` already exists in #{self.name}." 
    else
      self.send(:define_method, method_name, block)
    end
  end
end
