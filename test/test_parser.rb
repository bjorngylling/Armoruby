require 'test/unit'

require 'lib/armoruby'

class DunderCharacterTest < Test::Unit::TestCase

  def initialize(arg)
    Armoruby.setup :region => "eu", :realm => "outland"
    @char = Armoruby::Character.new("Tubal")
    
    super
  end

  def test_class
    assert_instance_of Armoruby::Character, @char
  end
  
  def test_name
    assert_equal "Tubal", @char.name
  end
  
  def test_level
    assert_equal 80, @char.level
  end
  
  def test_klass
    assert_equal "Priest", @char.klass[:name]
    assert_equal 5, @char.klass[:id]
  end
  
  def test_faction
    assert_equal "Alliance", @char.faction
  end
  
  def test_race
    assert_equal "Dwarf", @char.race[:name]
    assert_equal 3, @char.race[:id]
  end
  

  
end

class DunderCharacterTestAnotherRegion < Test::Unit::TestCase

  def initialize(arg)
    Armoruby.setup :region => "us", :realm => "sen'jin"
    @char = Armoruby::Character.new("Segolene")
    
    super
  end

  def test_class
    assert_instance_of Armoruby::Character, @char
  end
    
  def test_name
    assert_equal "Segolene", @char.name
  end
  
  def test_level
    assert_equal 80, @char.level
  end
  
  def test_klass
    assert_equal "Priest", @char.klass[:name]
    assert_equal 5, @char.klass[:id]
  end
  
  def test_faction
    assert_equal "Alliance", @char.faction
  end
  
  def test_race
    assert_equal "Night Elf", @char.race[:name]
    assert_equal 4, @char.race[:id]
  end
  
end