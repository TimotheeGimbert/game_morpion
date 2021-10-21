class Display

  def header
    puts '-'.blink * 60
    print ' ' * 18
    puts "--> Un JeU De MoRPiON <--".red
    puts '-'.blink * 60
    puts puts
  end

  def show_board(board)
    system 'clear'
    header
    for i in 0..8 do
      if [3,6,9].include?(i+1)
        puts board.cases[i].content + ' '
      elsif [1,4,7].include?(i+1)
        print ' ' * 27
        print board.cases[i].content + ' '
      else 
        print board.cases[i].content + ' '
      end
    end
    puts puts
  end

end