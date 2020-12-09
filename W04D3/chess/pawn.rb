require_relative 'piece'

class Pawn < Piece

  def moves
    row, col = @pos
    #white pawn move [1,0] ... black pawn move [-1,0]
 
  end

  def at_start_row?
    white_pawns = [[1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7]]
    black_pawns = [[6,0],[6,1],[6,2],[6,3],[6,4],[6,5],[6,6],[6,7]]
    if self.color == :white
      return white_pawns.include?(@pos)
    else
      return black_pawns.include?(@pos)
    end
  end

  def forward_dir
    if self.color == :white
      return 1
    else
      return -1
    end
  end

  def forward_steps

  end


end