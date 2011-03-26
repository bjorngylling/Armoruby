require 'nokogiri'
require 'rulebook'

# Require all files in lib/armoruby
$:.unshift File.dirname(__FILE__)
Dir["#{File.dirname(__FILE__)}/armoruby/*.rb"].each do |format| 
  require_relative "armoruby/#{File.basename format}"
end

module Armoruby
  
  def self.setup(options = {})
    @parser = Armoruby::Parser.new options
  end
  
  def self.parser
    @parser
  end
  
end