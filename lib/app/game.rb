class Game

  attr_accessor :player1, :player2, :board, :display, :game_is_on
  

  def initialize
    @display = Display.new
    @display.show_header
    @board = Board.new
    @game_is_on = true
  end

  def get_valid_name(player_number)
  # asks for a name until valid, then returns it
    puts " >>> WhAt WiLl bE tHe NamE oF thE pLayEr #{player_number} ?".green
    name = gets.chomp
    while not name.class == String && name.length > 1 do
      puts "YoU neEd To eNtEr a VaLiD nAme WiTh aT lEaSt 2 cHaracTeRs ..."
      name = gets.chomp
    end
    return name
  end

  def get_valid_symbol
  # asks for a symbol until valid, then returns it
    puts " >>> AnD WhAt WiLl bE hiS SymBoL ?".green
    symbol = gets.chomp
    while symbol.length != 1 || symbol == ' '  do
      puts "You neEd To eNtEr a VaLiD sYmBol oF onLY 1 cHaracTeRs ..."
      symbol = gets.chomp
    end
    return symbol
  end

  def create_player(player_number, color)
  # asks for name and symbol to create a player, then returns the object Player
    name = get_valid_name(player_number)
    symbol = get_valid_symbol
    symbol = color == 'color1' ? symbol.yellow : symbol.cyan
    new_player = Player.new(name, symbol)
    puts " We Are hApPy tO wElcoMe yoU iN thE gAme #{name}, you'r symbol is #{symbol}".blue
    puts puts
    return new_player
  end

  def escape_game?
  # returns true if someone is winning or if board is full
    if @player1.is_winning?(@board) || @player2.is_winning?(@board) then return true end
    if @board.is_full? then return true end
  end

  def get_winner
  # defines the winner and increases his score, returns the player winning
    if @player1.is_winning?(@board) 
      @player1.increase_score
      return @player1
    elsif @player2.is_winning?(@board) 
      @player2.increase_score
      return @player2
    end 
  end

  def congrats_winner(winner)
    puts " !!!!!!!!!!!  COnGRATS #{winner.name} ! YoU wIN ThiS GaME !".green
  end

  def play_again?
  # asks for a new game at the end, and set the instance variable @game_is_on 
    puts "YoU waNt tO pLaY anOtHeR GaMe ? ('y' or 'n')".yellow
    answer = gets.chomp
    if answer == 'y'
      @board = Board.new
      @player1.reset_sequence
      @player2.reset_sequence
      @game_is_on = true
    else
      @game_is_on = false
    end
  end

  def perform
    @player1 = create_player(1, 'color1')
    @player2 = create_player(2, 'color2')

    while @game_is_on do

      while !@board.is_full?                      # verifies that board is NOT full
        @display.show(@board, @player1, @player2) # displays the game on the screen
        @player1.play(@board)                     # object player is asked to modify the object board
        if escape_game? then break end            # escape on a potential winner
        @display.show(@board, @player1, @player2)
        @player2.play(@board)
        if escape_game? then break end
      end

      if @board.is_full? then puts "ThE bOaRd iS fulL ! NoBoDY wiNs"
      else winner = get_winner end

      @display.show(@board, @player1, @player2) 
      congrats_winner(winner)
      puts puts puts
      play_again?

    end

    @display.good_bye
  end

end