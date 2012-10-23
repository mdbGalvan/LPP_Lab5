# File : ppt_class.rb

# Esta clase simulará el juego de piedra, papel y tijera
# Aunque no la vamos a utilizar en esta práctica, pero es bastante interesante
# incluso para aprender el concepto de método de clase y forma de llamarlo
class Ppt
  
  # Variables de clase: 
      # Hash que almacena en las claves las opciones y en el valor a quien derrota
  @@wins = { :rock=>:scissor, :paper=>:rock, :scissor=>:paper }
      # Array que almacena las 3 opciones posibles
  @@options = @@wins.keys
  
  # Método de clase
  class << self
    
    # Método de Instancia
    def play (player_option)
      # Convierto la opción del jugador de string a Symbol
      player_option = player_option.to_sym
      
      # Lanzo un error en caso del que la opción introducida por el usuario no sea una de las posibles
      raise SystaxError, " Jugada incorrecta, debes elegir : '#{opcions.join(', ')}'" unless @@options.include? player_option
      
      # Mediante el hacer (sample) se elige una opción para la computadora
      computer_option = @@options.sample
      
      # Con ayuda del hash guardamos en answer como ha quedado nuestra apuesta
      answer =  case player_option
		when computer_option
		  " Hay un empate "
		when @@wins[computer_option]
		  " Lo siento!!! Has perdido. "
		else 
		  " Has ganado. "
		end
	    
    end # Fin play
    
  end # Fin << self
  
end # Fin Ppt

#puts Ppt.play("paper")
