class Board

  attr_accessor :cases
  attr_reader :winning_combos

  def initialize
    @cases = Array.new
    @cases << Case.new('A1')
    @cases << Case.new('B1')
    @cases << Case.new('C1')
    @cases << Case.new('A2')
    @cases << Case.new('B2')
    @cases << Case.new('C2')
    @cases << Case.new('A3')
    @cases << Case.new('B3')
    @cases << Case.new('C3')
    @winning_combos = [['A1','A2','A3'], ['B1','B2','B3'], ['C1','C2','C3'], ['A1','B1','C1'], ['A2','B2','C2'], ['A3','B3','C3'], ['A1','B2','C3'], ['A3','B2','C1']]
  end

  def play(player, choice)
    chosen_case = @cases.select {|obj| obj.position == choice}.pop
    chosen_case.content = player.symbol
    player.add_to_sequence(chosen_case)
  end

  def display
    # va afficher le board en fonction des combos arrays des players
    puts "CECI SERA LE BOARD GAME"
    #puts "Combo array of player 1 : " + @player1.combo.join(' ')
    #puts "Combo array of player 2 : " + @player2.combo.join(' ')
  end

  def is_full?
    if @cases.select {|c| c.content == 'empty'}.length == 0 
      puts "BOARD IS FULL"
      return true 
    else 
      puts "BOARD is free to go"
      return false
    end
  end

end