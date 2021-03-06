class Board

  attr_accessor :cases
  attr_reader :winning_combos, :valid_positions

  def initialize
    @cases = Array.new
    @cases << Case.new('A1')
    @cases << Case.new('A2')
    @cases << Case.new('A3')
    @cases << Case.new('B1')
    @cases << Case.new('B2')
    @cases << Case.new('B3')
    @cases << Case.new('C1')
    @cases << Case.new('C2')
    @cases << Case.new('C3')
    @winning_combos = [['A1','A2','A3'], ['B1','B2','B3'], ['C1','C2','C3'], ['A1','B1','C1'], ['A2','B2','C2'], ['A3','B3','C3'], ['A1','B2','C3'], ['A3','B2','C1']]
    @valid_positions = ['A1','A2','A3','B1','B2','B3','C1','C2','C3'] 
  end

  def place_symbol(player, position)
  # selects the case chosen by player, places the symbol into the case, and fill the player's sequence
    chosen_case = @cases.select {|obj| obj.position == position}.pop
    chosen_case.content = player.symbol
    player.add_to_sequence(chosen_case)
  end

  def is_free_case?(pos)
  # returns true if the case associated to the position is content free
    @cases.select {|c| c.position == pos}.pop.content == '.' ? true : false
  end

  def is_position_valid?(position)
  # returns true if the position exists in the array of valid positions and is free
    @valid_positions.include?(position) && is_free_case?(position) ? true : false
  end

  def is_full?
  # returns true if the board is full 
    @cases.select {|c| c.content == '.'}.length == 0 ? true : false
  end

end