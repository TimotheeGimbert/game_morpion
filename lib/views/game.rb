class Game

  attr_accessor :board, :player1, :player2

  def initialize
    @board = Board.new
    @player1 = create_player
    @player2 = create_player
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

  def is_a_winner?(player1, player2)
    # @board.winning_combos.include?(player1.combo)?
  end

  def perform

    while !@board.is_full? # verifies that board is NOT full
      @board.display(@player1, @player2) # display the board on the screen
      ask_to_play(@player1) # object player is asked to modify the object board
      is_a_winner?(@player1, @player2) # check for a potential winner
      @board.display(@player1, @player2)
      ask_to_play(@player2)
      is_a_winner?(@player1, @player2)
    end
  end

end