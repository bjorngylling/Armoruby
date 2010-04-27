module Armoruby
  
  ##
  # Note:
  # We can't overwrite .class so we just rename getting the character wow-class
  # klass instead.
  class Character
    
    def initialize(name)
      attributes = Armoruby.parser.load_character name
      
      attributes[:klass] = attributes[:class]
      attributes.delete :class
      
      self.class.class_eval "attr_reader :#{attributes.keys.join(', :')}"
      
      attributes.each do |key, attribute|
        key = "@#{key.to_s}".to_sym
        self.instance_variable_set key, attribute 
      end
    end
    
  end
  
end