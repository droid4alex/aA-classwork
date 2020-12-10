require_relative 'slidable_module'
# require_relative 'rook_bishop_queen.rb'

#see solution for pieces.rb requiring all pieces!!

class Piece
  attr_reader :color, :board
  attr_accessor :pos
  # include Slidable_Module

  def initialize(symbol, board, pos)
    @color = symbol
    @board = board
    @pos = pos    
  end
end