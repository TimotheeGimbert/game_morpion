class Board

  attr_accessor :free_boxes_left

  def initialize
    @free_boxes_left = 9
  end

  def check_box(spot)
    puts 'box checked'
    @free_boxes_left -= 1
  end

  def is_full?
    @free_boxes_left < 1 ? true : false
  end

end