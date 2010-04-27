require 'test/unit'

require 'lib/armoruby'

class DunderParserTest < Test::Unit::TestCase

  def test_character_eu_outland
    Armoruby.setup :region => "eu", :realm => "outland"
    
    tubal = Armoruby::Character.new("Tubal")
    
    assert_instance_of Armoruby::Character, tubal
    
    assert_equal "Tubal", tubal.name
    assert_equal 80, tubal.level
    assert_equal "Priest", tubal.klass[:name]
    assert_equal 5, tubal.klass[:id]
    assert_equal "Alliance", tubal.faction
  end
  
  def test_character_us_senjin
    # Test another region and realm
    Armoruby.setup :region => "us", :realm => "sen'jin"
    
    segolene = Armoruby::Character.new("Segolene")
    
    assert_instance_of Armoruby::Character, segolene
    
    assert_equal "Segolene", segolene.name
    assert_equal 80, segolene.level
    assert_equal "Priest", segolene.klass[:name]
    assert_equal 5, segolene.klass[:id]
    assert_equal "Alliance", segolene.faction
  end
  
end