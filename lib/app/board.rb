class Board

  attr_accessor :free_boxes_left, :player1, :player2
  attr_reader :winning_combos

  def initialize(player1, player2)
    @free_boxes_left = 9
    @winning_combos = [['A1','A2','A3'], ['B1','B2','B3'], ['C1','C2','C3'], ['A1','B1','C1'], ['A2','B2','C2'], ['A3','B3','C3'], ['A1','B2','C3'], ['A3','B2','C1']]
    @player1 = player1
    @player2 = player2
  end

  def display
    # va afficher le board en fonction des combos arrays des players
    puts "CECI SERA LE BOARD GAME"
    puts "Combo array of player 1 : " + @player1.combo.join(' ')
    puts "Combo array of player 2 : " + @player2.combo.join(' ')
  end

  def is_full?
    @free_boxes_left < 1 ? true : false
  end

end