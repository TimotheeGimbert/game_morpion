class Player
  
  attr_accessor :name, :symbol, :sequence
  
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @sequence = Array.new # will hold the sequence of boxes checked by the player
  end

  def get_valid_position(board)
    chosen_position = gets.chomp.upcase
    while not board.is_position_valid?(chosen_position) do
      puts "You need to type a valid position !".red
      puts "The valid positions are as follow :".blue
      puts board.valid_positions.join(', ')
      chosen_position = gets.chomp.upcase
    end
    return chosen_position
  end

  def play(board)
    puts "  --> It's #{@name}'s turn to play !".green
    chosen_position = get_valid_position(board)
    board.place_symbol(self, chosen_position)
  end

  def add_to_sequence(chosen_case)
    @sequence << chosen_case.position
  end

  def is_winning?(board)
    win_combo = board.winning_combos.select { |combo| (combo - @sequence).empty? }
    win_combo.empty? ? false : true
  end

end