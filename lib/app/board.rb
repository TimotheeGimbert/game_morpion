class Board

  attr_accessor :boxes
  attr_reader :winning_combos

  def initialize
    @free_boxes_left = 9
    @winning_combos = [['A1','A2','A3'], ['B1','B2','B3'], ['C1','C2','C3'], ['A1','B1','C1'], ['A2','B2','C2'], ['A3','B3','C3'], ['A1','B2','C3'], ['A3','B2','C1']]
    @boxes = Array.new
    @boxes << CheckBox.new({'A' => '1'})
    @boxes << CheckBox.new({'B' => '1'})
    @boxes << CheckBox.new({'C' => '1'})
    @boxes << CheckBox.new({'A' => '2'})
    @boxes << CheckBox.new({'B' => '2'})
    @boxes << CheckBox.new({'C' => '2'})
    @boxes << CheckBox.new({'A' => '3'})
    @boxes << CheckBox.new({'B' => '3'})
    @boxes << CheckBox.new({'C' => '3'})
  end

  def display
    # va afficher le board en fonction des combos arrays des players
    puts "CECI SERA LE BOARD GAME"
    #puts "Combo array of player 1 : " + @player1.combo.join(' ')
    #puts "Combo array of player 2 : " + @player2.combo.join(' ')
  end

  def is_full?
    @boxes.select {|box| box.content == 'empty'}.length == 0 ? true : false
  end

end