require_relative 'slidable_module'
# require_relative 'rook_bishop_queen.rb'

#see solution for pieces.rb requiring all pieces!!

class Piece
  attr_reader :color, :board, :symbol
  attr_accessor :pos
  # include Slidable_Module

  def initialize(color, board, pos, symbol)
    @color = color
    @board = board
    @pos = pos
    @symbol = symbol
  end
end