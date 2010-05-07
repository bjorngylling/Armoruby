module Armoruby
  
  ##
  # Note:
  # We can't overwrite .class so we just rename getting the character wow-class
  # klass instead.
  class Character
    
    def initialize(name)
      attributes = Armoruby.parser.load_character name
      
      validate :attributes => attributes, :replace => {:class => :klass}, :ignore => [:name]
      
      self.class.send :attr_accessor, *attributes.keys
      
      attributes.each do |key, attribute|
        self.instance_variable_set "@#{key.to_s}".to_sym, attribute 
      end
    end
    
    def active_talent_spec
      talents.select { |spec| spec[:active] }.first
    end
    
    rule /is_a_(\w+)?/ do |attribute|
      has_attribute? attribute
    end
    
  private
  
    def has_attribute?(attribute)
      if(is_class? attribute or is_race? attribute)
        return true
      end
      
      if(attribute =~ /(\w+)_#{klass[:name].downcase.gsub(/ /, "_")}$/)
        if(is_spec? $1)
          return true
        end
      end
      
      return false
    end
    
    def is_spec?(test_spec)
      active_talent_spec[:name].downcase.include? test_spec
    end
    
    def is_race?(test_race)
      race[:name].downcase.gsub(/ /, "_") == test_race
    end
    
    def is_class?(test_class)
      klass[:name].downcase.gsub(/ /, "_") == test_class
    end
  
    def validate(options = {})
      # First we rename those attributes we know will collide
      options[:replace].each do |before, after|
        options[:attributes][after] = options[:attributes][before]
        options[:attributes].delete before
      end
      
      # Then we check if there's still any collision and throw an exception
      attributes_to_check = options[:attributes].keys.map { |x| x.to_s }
      attributes_to_check -= options[:ignore].map { |x| x.to_s }
      
      collisions = self.class.methods & attributes_to_check
      if collisions.length > 0
        raise "Reserved Object methods can not be overwritten!"
      end
    end
    
  end
  
end