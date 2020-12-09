require_relative 'piece'
require_relative 'slidable_module'

class Queen < Piece
  include Slidable_Module

end

class Bishop < Piece
  include Slidable_Module
 
end

class Rook < Piece
  include Slidable_Module

end