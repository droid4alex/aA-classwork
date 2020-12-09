require_relative 'slidable_module'

class Piece
  attr_reader :color, :board
  attr_accessor :pos
  include Slidable_Module


  def initialize(symbol, board, pos)
    @color = symbol
    @board = board
    @pos = pos    
  end
end