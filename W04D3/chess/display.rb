require_relative 'cursor'
require 'colorize'

class Display
    
    def initialize(board = Board.new)
        @board = board
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        row, col = @cursor.cursor_pos
        if @cursor.selected
            @board[row][col].colorize(:red)
        end
        @board[row][col]        
    end
end