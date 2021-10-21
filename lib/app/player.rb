class Player
  
  attr_accessor :name, :symbol, :sequence, :score
  
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @sequence = Array.new # will hold the sequence of boxes checked by the player
    @score = 0
  end

  def get_valid_position(board)
  # asks for a position until valid, then returns it
    chosen_position = gets.chomp.upcase
    while not board.is_position_valid?(chosen_position) do
      puts "You need to type a valid and free position !".red
      puts "The valid positions should be typed as follow :".blue
      puts board.valid_positions.join(', ')
      chosen_position = gets.chomp.upcase
    end
    return chosen_position
  end

  def play(board)
  # asks the player for a position and make board write the symbol on the case
    puts "  --> #{@name} c'est ton tour !".green
    chosen_position = get_valid_position(board)
    board.place_symbol(self, chosen_position)
  end

  def add_to_sequence(chosen_case)
  # adds the case played in the sequence array of the player
    @sequence << chosen_case.position
  end

  def reset_sequence
  # sets a new array of sequence for new game
    @sequence = Array.new
  end

  def increase_score
    @score += 1
  end

  def is_winning?(board)
  # returns true if the player has a winning combo 
    win_combo = board.winning_combos.select { |combo| (combo - @sequence).empty? }
    win_combo.empty? ? false : true
  end

end