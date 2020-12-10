require_relative 'piece'
require_relative 'slidable_module'

class Queen < Piece
  include Slidable_Module
  #symbol.colorize(color) ♔ ♕ ♖ ♗ ♘ ♙ 
  #protected
  #def move_dirs
  #horizontal_and_vertical_dirs + diagnoal_dirs
  #end
end

class Bishop < Piece
  include Slidable_Module
 
end

class Rook < Piece
  include Slidable_Module

end