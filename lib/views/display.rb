class Display

  def show_board(board)
    for i in 0..8 do
      if [3,6,9].include?(i+1)
        puts board.cases[i].content
      else 
        print board.cases[i].content
      end
    end
  end

end