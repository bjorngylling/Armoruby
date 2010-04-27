require 'rubygems'
require 'nokogiri'

# Require all files in lib/armoruby
$:.unshift File.dirname(__FILE__)
Dir["#{File.dirname(__FILE__)}/armoruby/*.rb"].each { |format| require "armoruby/#{File.basename format}" }

module Armoruby
    
  attr_reader :parser
  
  class API
    include Armoruby
    
    def intialize(region, realm)
      setup_parser(region, realm)
    end
    
    def setup_parser(region, realm)
      @parser = Armoruby::Parser.new(region, realm)
    end
  end
  
end