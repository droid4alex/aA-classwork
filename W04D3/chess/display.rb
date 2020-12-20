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
            @board.rows[row][col].symbol.to_s.colorize(:red)
        else  
            @board.rows[row][col].symbol.to_s.colorize(:white)
        end
        print_arr = Array.new(8, Array.new())
        @board.rows.each_with_index do |row, i|
            row.each do |el|
                if el.class != Null_Piece
                     print_arr[i] << el.symbol.to_s.colorize(:red) if el.color == :white
                     print_arr[i] << el.symbol.to_s.colorize(:white) if el.color == :black
                 else
                    print_arr[i] << '-'
                 end
            end                   
            # p row.join(" ")
        end
        print_arr.each do |row|
            p row
        end
    end
end