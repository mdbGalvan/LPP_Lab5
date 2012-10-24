# File:  tc_ppt.rb
 
require "ppt"
require "test/unit"

# $ ruby -Ilib   tc_ppt.rb

class TestPpt < Test::Unit::TestCase
 
  @@options = %w[:rock :paper :scissor]
  
  def setup
    @Ppt = Ppt.new("paper")
  end
 
  def teardown
    # Nothing really
  end
 
  def test_equal
    assert_equal("Empate", @Ppt.who_wins())
    assert_equal(0, @Ppt.winner()) # Nada más inicializar, el winner es empate
    assert_equal(0, @Ppt.play) # Ahora mismo el play es 0, ya que está empatados
    #assert_equal("rock".to_sym, @Ppt.player_option("rock"))
  end
  
  def test_instance
    assert_instance_of(String, @Ppt.to_s)
  end
  
  def test_delta
    assert_in_delta(0, @Ppt.avg(5), 1 ) # Se comprueba que la avg está entre [-1, 1]
  end 
 
  def test_typecheck
    assert_raise( RuntimeError, "Invalid Argument" ) { Ppt.new("piedra") }
    assert_raise( RuntimeError, "Empty Argument" ) { Ppt.new('') }
    assert_raise( RuntimeError, "Invalid Argument" ) { @Ppt.player_option("piedra") }
    assert_raise( RuntimeError, "Invalid Argument" ) { @Ppt.computer_option("piedra") }
    assert_raise( RuntimeError, "Negative Argument" ) { @Ppt.avg(-1) }
    assert_raise( RuntimeError, "String Argument" ) { @Ppt.avg('a') }    
  end
 
end