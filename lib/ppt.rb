# File: ppt.rb

# Simulará el juego de piedra, papel y tijera mediante métodos de instancia
class Ppt
  
  # Creo el método de obtener (y no el de establecer) de los atributos
  # El write me interesa pasarlo a to_sym en los atributos *_option, para asegurarme que es symbol, por eso lo defino luego
  attr_reader :player_option, :computer_option, :winner  
  
  # Variables de clase: 
      # Hash que almacena en las claves las opciones y en el valor a quien derrota
  @@wins = { :rock=>:scissor, :paper=>:rock, :scissor=>:paper }
      # Array que almacena las 3 opciones posibles
  @@options = @@wins.keys
  
  # Método de instancia que llama el constructor new para inicializar los atributos
  def initialize(player_option)
    # Convierto la opción del jugador de string a Symbol
    player_option = player_option.to_sym
    
    # Lanzo un error en caso del que la opción introducida por el usuario no sea una de las posibles
    raise unless @@options.include? player_option
    
    # Inicializo los atributos
    @player_option = player_option # Symbol
    @computer_option = player_option # Symbol
    @winner = 0 # 0 = empate, -1 = máquina, 1 = jugador externo
  end
  
  # Método que estable el valor del atributo @player_option
  def player_option(player_options)
    raise unless @@options.include? player_options
    @player_option = player_options.to_sym
  end
  
  # Método que estable el valor del atributo @computer_option
  def computer_option(computer_options)
    raise unless @@options.include? computer_options
    @computer_option = computer_options.to_sym
  end  
  
  # Método del objeto que determinará quién gana numéricamente, para luego poder hacer media
  def play
    if @player_option == @computer_option
      @winner = 0
    elsif @player_option == @@wins[@computer_option]
      @winner = -1
    else
      @winner = 1
    end
  end
  
  # Este método convertirá a string la información del objeto de la clase Ppt
  def to_s
    "Jugador: " + @player_option.to_s + ", Maquina: " + @computer_option.to_s + " y Gana: " + self.who_wins
  end
  
  # Método que muestra quién gana en string
  def who_wins
    case @winner
    when 0
      "Empate"
    when -1
      "Maquina"
    else
      "Jugador"
    end
  end
  
  # Determina la media, si se realizara el juego n veces, con la misma jugada para el jugador
  # y la jugada de la máquina aleatoriamente
  def avg (n)
    raise unless ( n.is_a?(Numeric) && (n > 0) )
    media = 0.0
    n.times do  |n|
      self.computer_option(@@options.sample)
      self.play
      media = media + self.winner
    end
    media = media/n
  end
  
end  

#C = Ppt.new("rock")
#puts C.avg(-1)
#puts C.to_s

