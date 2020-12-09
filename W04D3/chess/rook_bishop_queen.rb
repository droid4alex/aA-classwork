require_relative 'piece.rb'
require_relative 'slidable_module.rb'

class Queen < Piece
  include Slidable_Module
  def initialize(symbol, board, pos)
    super
  end
end

class Bishop < Piece
  include Slidable_Module
  def initialize(symbol, board, pos)
    super
  end
end

class Rook < Piece
  include Slidable_Module
  def initialize(symbol, board, pos)
    super
  end
end