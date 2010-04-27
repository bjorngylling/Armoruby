require 'open-uri'

module Armoruby
  
  class Parser
    
    def initialize(options = {})
      # Setup our region and realm, fall back on some defaults if none are specified
      @region = options[:region] || "eu"
      @realm = options[:realm] || "outland"
    end
    
    def load_character(character_name)
      url = "http://#{@region}.wowarmory.com/character-sheet.xml?r=#{@realm}&cn=#{character_name}"
      xml_doc = parse url
      
      character = xml_doc.at_css("character")
      result = {:name => character['name'],
                :level => character['level'].to_i,
                :class => {:id => character['classId'].to_i,
                           :name => character['class']},
                :faction => character['faction']}
      
      return result
    end
    
  private
    def parse(url)
      
      Nokogiri::XML(open(url, "User-Agent" => 'Mozilla/5.0 Gecko/20070219 Firefox/2.0.0.2'))
      
    end
    
  end
  
end