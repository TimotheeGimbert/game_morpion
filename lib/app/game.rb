class Game

  attr_accessor :player1, :player2, :board, :display

  def initialize
    @player1 = create_player
    @player2 = create_player
    @board = Board.new
    @display = Display.new
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

  def show_winner
    if @player1.is_winning?(@board) then puts "COnGRATS #{@player1.name} ! YOU WIN THE GAME !"
    elsif @player2.is_winning?(@board) then puts "COnGRATS #{@player2.name} ! YOU WIN THE GAME !" 
    else puts "The board is full ! NOBODY WINS" end  
  end

  def make_play(player)
    puts "You can play #{player.name}"
    choice = gets.chomp
    @board.play(player, choice)
  end

  def escape_game?
    if @player1.is_winning?(@board) || @player2.is_winning?(@board) then return true end
    if @board.is_full? then return true end
  end

  def perform

    while !@board.is_full?                        # verifies that board is NOT full
      @display.show_board(@board)                 # display the board on the screen
      make_play(@player1)                         # object player is asked to modify the object board
      if escape_game? then break end     # escape on a potential winner
      @display.show_board(@board)
      make_play(@player2)
      if escape_game? then break end
    end

    show_winner

    puts "- END OF THE GAME -"
  end

end