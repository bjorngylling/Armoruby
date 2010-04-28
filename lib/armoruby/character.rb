module Armoruby
  
  ##
  # Note:
  # We can't overwrite .class so we just rename getting the character wow-class
  # klass instead.
  class Character
    
    def initialize(name)
      attributes = Armoruby.parser.load_character name
      
      validate attributes
      
      self.class.send :attr_accessor, *attributes.keys
      
      attributes.each do |key, attribute|
        self.instance_variable_set "@#{key.to_s}".to_sym, attribute 
      end
    end
    
  private
  
    def validate(attributes)
      # First we rename those attributes we know will collide
      attributes[:klass] = attributes[:class]
      attributes.delete :class
      
      # The following are allowed to be overwritten
      ignore = ["name"]
      
      # Then we check if there's still any collision and throw an exception
      collisions = self.class.methods & (attributes.keys.map { |key| key.to_s } - ignore)
      if collisions.length > 0
        raise "Reserved Object methods can not be overwritten!"
      end
    end
    
  end
  
end