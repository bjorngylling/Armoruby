require 'test/unit'

require 'lib/armoruby'

class DunderParserTest < Test::Unit::TestCase

  def setup
    @parser = nil
    @parser = Armoruby::Parser.new
  end

  def test_character
    character = @parser.load_character("Tubal")
    
    assert_instance_of Armoruby::Character, character
    
    assert_equal "Tubal", character.name
    assert_equal 80, character.level
    assert_equal "Priest", character.class[:name]
    assert_equal 5, character.class[:id]
    assert_equal "Alliance", character.faction
  end
  
end