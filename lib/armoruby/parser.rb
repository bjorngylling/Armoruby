require 'open-uri'

module Armoruby
  
  class Parser
    
    def initialize(options = {})
      @region = options[:region]
      @realm = options[:realm]
    end
    
    def load_character(character_name)
      xml_doc = parse
      
      character = xml_doc.at_css("character")
      result = {:name => character['name'],
                :level => character['level'].to_i,
                :class => {:id => character['classId'].to_i,
                           :name => character['class']},
                :faction => character['faction']}
      
      Armoruby::Character.new result
    end
    
  private
    def parse(options = {})
      url = "http://eu.wowarmory.com/character-sheet.xml?r=Outland&cn=Tubal"
      Nokogiri::XML(open(url, "User-Agent" => 'Mozilla/5.0 Gecko/20070219 Firefox/2.0.0.2'))
      
    end
  end
  
end