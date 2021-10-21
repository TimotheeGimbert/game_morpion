class Player
  
  attr_accessor :name, :symbol, :sequence
  
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @sequence = Array.new # will hold the sequence of boxes checked by the player
  end

  def add_to_sequence(chosen_case)
    @sequence << chosen_case.position
  end

end