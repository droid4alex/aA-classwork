require_relative 'piece'

class Pawn < Piece

  def moves
    row, col = @pos
    #white pawn move [1,0] ... black pawn move [-1,0]
    #bottom 3 functions to move; forward direction, forward step, side attack
 
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
    arr = []
    row, col = @pos
    if at_start_row?
      arr << [row+forward_dir, col] if @rows[row+forward_dir][col] == @null_piece 
    else  
      return 1
    end


  end

  def side_attacks
    row, col = pos
    arr = []

    if self.color == :white
      arr << [row+1,col+1] if @rows[row+1][col+1] != @null_piece && @rows[row+1][col+1].color != :white
      arr << [row+1,col-1] if @rows[row+1][col-1] != @null_piece && @rows[row+1][col-1].color != :white
    else  
      arr << [row-1,col+1] if @rows[row-1][col+1] != @null_piece && @rows[row-1][col+1].color != :black
      arr << [row-1,col-1] if @rows[row-1][col-1] != @null_piece && @rows[row-1][col-1].color != :black
    end

    arr
  end

end