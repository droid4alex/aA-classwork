require_relative 'cursor'
require_relative 'board'
require 'colorize'

class Display
    attr_reader :cursor, :board
    
    
    def initialize(board = Board.new)
        @board = board
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        row, col = @cursor.cursor_pos
        if @cursor.selected
            @board.rows[row][col].class.to_s.colorize(:red)
        else  
            @board.rows[row][col].class.to_s.colorize(:white)
        end
        # @board[row][col]        
    end
end