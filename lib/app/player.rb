class Player
  
  attr_accessor :name, :symbol, :combo
  
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @combo = Array.new # will hold the sequence of boxes checked by the player
  end

  def play(board, box_checked)
    @combo << box_checked # player's combo array is completed with the new entry
  end

end