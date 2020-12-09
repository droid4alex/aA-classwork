module Slidable_Module
  
  HORIZONTAL_DIRS = [[0,1], [1,0], [-1,0], [0,-1]]
  DIAGONAL_DIRS = [[1,1],[1,-1],[-1,-1],[-1,1]]

  def horizontal_dirs  
    HORIZONTAL_DIRS
  end

  def diagonal_dirs  
    DIAGONAL_DIRS
  end

  #returns 2d array of possible moves; hit piece or off board
  def moves
    pos = [0,0]
    row, col = pos
    arr = []

    HORIZONTAL_DIRS.each do |h_pos|
      h_row, h_col = h_pos
      grow_unblocked_moves_in_dir(h_row, h_col) #returns all moves in h_pos

    end
  end

  def grow_unblocked_moves_in_dir(dx, dy) 
    arr = []
    row, col = @pos
    while dx + row < 8 && dx + row >= 0 && dy + col < 8 && dy + col >= 0 
      row_dx, col_dy = [dx + row, dy + col]
      arr << [row_dx, col_dy] if @board.rows[row_dx][col_dy] == @board.null_piece
      if @board.rows[row_dx][col_dy].color != @color
        arr << [row_dx, col_dy]
        break
      end
      row += dx
      col += dy
    end
    arr
  end
  
end