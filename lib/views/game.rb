class Game

  attr_accessor :player1, :player2, :board

  def initialize
    @player1 = create_player
    @player2 = create_player
    @board = Board.new(@player1, @player2)
  end

  def create_player
    puts "WhAt WiLl bE tHe NamE oF thE pLayEr ?"
    name = gets.chomp
    new_player = Player.new(name)
    puts "We Are hApPy tO wElcoMe yoU iN thE gAme #{name}"
    return new_player
  end

  def ask_to_play(player)
    puts "You can play #{player.name}"
    box_checked = gets.chomp
    player.play(@board, box_checked)
  end

  def is_a_winner?
    # @board.winning_combos.include?(@player1.combo)?
  end

  def perform

    while !@board.is_full? # verifies that board is NOT full
      @board.display # display the board on the screen
      ask_to_play(@player1) # object player is asked to modify the object board
      is_a_winner? # check for a potential winner
      @board.display
      ask_to_play(@player2)
      is_a_winner?
    end
  end

end