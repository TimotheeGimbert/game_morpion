class Display

  def header
  # displays the game banner
    puts '-'.blink * 60
    print ' ' * 18
    puts "--> Un JeU De MoRPiON <--".red
    puts '-'.blink * 60
    puts puts
  end

  def show_board(board)
  # draws the header and the board below, after interogating content values of each cases of board object 
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

  def good_bye
    puts "CoOl To hAvE plAyEd witH YoU !".green
    puts puts
    puts "- END OF THE GAME -"
    puts puts
  end

end