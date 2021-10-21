class Player
  
  attr_accessor :name, :symbol, :sequence
  
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @sequence = Array.new # will hold the sequence of boxes checked by the player
  end

  def play(board)
    puts "You can play #{@name}"
    choice = gets.chomp
    board.place_symbol(self, choice)
  end

  def add_to_sequence(chosen_case)
    @sequence << chosen_case.position
  end

  def is_winning?(board)
    win_combo = board.winning_combos.select { |combo| (combo - @sequence).empty? }
    win_combo.empty? ? false : true
  end

end