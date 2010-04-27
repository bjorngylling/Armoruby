module Armoruby
  
  ##
  # Note:
  # The .class for this class will be overwritten to get the characters
  # ingame class. If you want to make sure something is a Character class
  # you should use .kind_of?()
  class Character
    include Armoruby
    
    def initialize(attributes = {:name => "",
                                 :level => 0,
                                 :class => {:id => 0,
                                            :name => "",
                                            :image => ""},
                                 :faction => ""})
      
      self.class.class_eval "attr_reader :#{attributes.keys.join(', :')}"
      
      attributes.each do |key, attribute|
        key = "@#{key.to_s}".to_sym
        self.instance_variable_set key, attribute 
      end
      
      # @name = options[:name]
      # @level = options[:level]
      # @class = {:id => options[:class_id],
      #           :name => options[:class_name]}
      # @faction = options[:faction]
    end
  end
  
end