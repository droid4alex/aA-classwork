module Stepable_Module

    def moves  
    
        row, col = @pos
        knight_moves =[[1,2], [1,-2], [2, -1], [2,1], [-1,-2], [-1,2], [-2, 1], [-2,-1]]
        king_moves =[[0,1], [1,0], [-1,0], [0,-1], [1,1],[1,-1],[-1,-1],[-1,1]]
        all_knight = []
        all_king = []

        knight_moves.each do |sub_arr|
            knight_r, knight_c = sub_arr
            row_dx, col_dy = [knight_r + row, knight_c + col]
            if row_dx < 8 && row_dx >= 0 && col_dy < 8 && col_dy >= 0
                if @board.rows[row_dx][col_dy] == @board.null_piece
                    all_knight << [row_dx, col_dy] 
                elsif @board.rows[row_dx][col_dy].color != @color
                    all_knight << [row_dx, col_dy]
                end
            end
        end

        king_moves.each do |sub_arr|
            king_r, king_c = sub_arr
            row_dx, col_dy = [king_r + row, king_c + col]
            if row_dx < 8 && row_dx >= 0 && col_dy < 8 && col_dy >= 0
                if @board.rows[row_dx][col_dy] == @board.null_piece
                    all_king << [row_dx, col_dy] 
                elsif @board.rows[row_dx][col_dy].color != @color
                    all_king << [row_dx, col_dy]
                end
            end
        end

        if self.class == Knight
         return all_knight
        elsif self.class == King
         return all_king
        end
    end

    def move_diffs

    end
end