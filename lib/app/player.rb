class Player
  
  attr_accessor :name, :combo
  
  def initialize(name)
    @name = name
    @combo = Array.new # will hold the sequence of boxes checked by the player
  end

  def play(board, box_checked)
    board.free_boxes_left -= 1 # player is modifying board object attr_accessor
    @combo << box_checked # player's combo array is completed with the new entry
  end

end