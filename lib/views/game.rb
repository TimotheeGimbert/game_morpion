class Game



  def perform
    player1 = Player.new('Luca')
    player2 = Player.new('Lilou')
    
    board = Board.new
    
    while !board.is_full?
      player1.play(board, 'A1')
    end
  end

end