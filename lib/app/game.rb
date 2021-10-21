class Game

  attr_accessor :player1, :player2, :board, :display

  def initialize
    @display = Display.new
    @display.header
    @board = Board.new
  end

  def get_valid_name(player_number)
    puts " >>> WhAt WiLl bE tHe NamE oF thE pLayEr #{player_number} ?".green
    name = gets.chomp
    while not name.class == String && name.length > 1 do
      puts "YoU neEd To eNtEr a VaLiD nAme WiTh aT lEaSt 2 cHaracTeRs ..."
      name = gets.chomp
    end
  end

  def create_player(player_number, color) 
    name = get_valid_name(player_number)
    puts " >>> AnD WhAt WiLl bE hiS SymBoL ?".green
    symbol = gets.chomp
    symbol = color == 'color1' ? symbol.yellow : symbol.cyan
    new_player = Player.new(name, symbol)
    puts " We Are hApPy tO wElcoMe yoU iN thE gAme #{name}, you'r symbol is #{symbol}".blue
    puts puts
    return new_player
  end

  def show_winner
    if @player1.is_winning?(@board) then puts "COnGRATS #{@player1.name} ! YOU WIN THE GAME !"
    elsif @player2.is_winning?(@board) then puts "COnGRATS #{@player2.name} ! YOU WIN THE GAME !" 
    else puts "The board is full ! NOBODY WINS" end  
  end

  def escape_game?
    if @player1.is_winning?(@board) || @player2.is_winning?(@board) then return true end
    if @board.is_full? then return true end
  end

  def perform
    @player1 = create_player(1, 'color1')
    @player2 = create_player(2, 'color2')

    while !@board.is_full?              # verifies that board is NOT full
      @display.show_board(@board)       # display the board on the screen
      @player1.play(@board)             # object player is asked to modify the object board
      if escape_game? then break end    # escape on a potential winner
      @display.show_board(@board)
      @player2.play(@board)
      if escape_game? then break end
    end

    @display.show_board(@board)

    show_winner

    puts puts
    puts "- END OF THE GAME -"
  end

end