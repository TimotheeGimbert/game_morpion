class CheckBox

  attr_accessor :position, :content

  def initialize(hash_position)
    @position = (hash_position)
    @content = 'empty'
  end

  def change_content(player)
    @content = player.symbol
  end
  
end
