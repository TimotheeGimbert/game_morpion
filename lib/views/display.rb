class Display

  def show_header
  # displays the game banner after clear system
    system 'clear'
    puts '-'.blink * 60
    print ' ' * 18
    puts "--> Un JeU De MoRPiON <--".red
    puts '-'.blink * 60
    puts puts puts
  end

  def show(board, player1, player2)
  # draws the header and the board 
    show_header
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
    show_scores(player1, player2)
  end

  def show_scores(player1, player2)
    puts puts
    puts "#{player1.name}    #{player1.score}  |  #{player2.score}    #{player2.name}".magenta
    puts puts
  end

  def good_bye
    puts ">> CoOl To hAvE plAyEd witH YoU !".yellow
    puts puts
    puts "- END OF THE GAME -".red
    puts puts
  end

end