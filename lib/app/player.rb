class Player
  
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end

  def play(board, spot)
    board.check_box(spot)
  end

end