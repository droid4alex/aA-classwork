class Board

    def initialize(size)
        @size = size
        @grid = Array.new(size){Array.new(size)}
    end

    def size
        @size
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, mark)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = mark
    end

    def complete_row?(mark)
        @grid.any? {|row| row.all?(mark)}
    end

    def complete_col?(mark)
        @grid.transpose.any? {|row| row.all?(mark)}
    end

    def complete_diag?(mark)
        left_diag = (0...@grid.length).all? do |i|
            pos = [i, i]
            self[pos] == mark
        end
        right_diag = (0...@grid.length).all? do |i|
            pos = [i, @grid.length - 1 - i]
            self[pos] == mark
        end
        left_diag || right_diag
    end

    def winner?(mark)
        complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
    end
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
