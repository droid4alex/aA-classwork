class Piece
  attr_reader :color
  attr_accessor :pos

  def initialize(symbol, board, pos)
    @color = symbol
    @board = board
    @pos = pos    
  end
end