class Game

  attr_accessor :player1, :player2, :board, :display

  def initialize
    @player1 = create_player
    @player2 = create_player
    @board = Board.new
    @display = Display.new(@board)
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

  def show_winner(player)
    puts "COnGRATS #{player.name} ! YOU WIN THE GAME !"    
  end

  def make_play(player)
    puts "You can play #{player.name}"
    choice = gets.chomp
    @board.play(player, choice)
  end

  def winner?
    @board.winning_combos.each do |combo| 
      if combo - @player1.sequence == [] then return player1
      elsif combo - @player2.sequence == [] then return player2
      else return nil
      end
    end
  end

  def perform

    while !@board.is_full?        # verifies that board is NOT full
      @display.show_board      # display the board on the screen
      make_play(@player1)         # object player is asked to modify the object board
      if winner? then break end   # escape on a potential winner
        @display.show_board
      make_play(@player2)
      if winner? then break end
    end

    show_winner(winner?)

    puts "- END OF THE GAME -"
  end

end