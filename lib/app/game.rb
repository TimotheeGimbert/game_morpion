class Game

  attr_accessor :player1, :player2, :board

  def initialize
    @player1 = create_player
    @player2 = create_player
    @board = Board.new
  end

  def create_player
    puts "WhAt WiLl bE tHe NamE oF thE pLayEr ?"
    name = gets.chomp
    puts "AnD WhAt WiLl bE hiS SymBoL ?"
    symbol = gets.chomp
    new_player = Player.new(name, symbol)
    puts "We Are hApPy tO wElcoMe yoU iN thE gAme #{name}"
    return new_player
  end

  def ask_to_play(player)
    puts "You can play #{player.name}"
    box_checked = gets.chomp
    player.play(@board, box_checked)
  end

  def is_a_winner?
    @board.winning_combos.each do |winning_combo| # a winning combo looks like ['A1','A2','A3']
      if winning_combo - @player1.combo == []
        show_winner(player1)
        return true
      end
      if winning_combo - @player2.combo == []
        show_winner(player2)
        return true
      end
    end
    return false
  end

  def show_winner(player)
    puts player.name + ' WINS !'
  end

  def perform

    while !@board.is_full?  # verifies that board is NOT full
      @board.boxes.each {|b| puts b.position}
      @board.display        # display the board on the screen
      ask_to_play(@player1) # object player is asked to modify the object board
      if is_a_winner? then break end # check for a potential winner
      @board.display
      ask_to_play(@player2)
      if is_a_winner? then break end # check for a potential winner
    end

    puts "END OF THE GAME"
  end

end