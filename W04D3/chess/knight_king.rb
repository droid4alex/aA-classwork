require_relative 'piece'
require_relative 'stepable_module'

class Knight < Piece
  include Stepable_Module
end


class King < Piece
  include Stepable_Module
end