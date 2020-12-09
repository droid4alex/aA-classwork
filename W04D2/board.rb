class Board
  def initialize
    @rows = Array.new(8){Array.new(8)}
    @null_piece = nil             #come back to this... singleton
  end

  def test_print
    @rows.each do |row|
      p row
    end
    return nil
  end

  def [](pos)
    @rows[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @rows[pos[0]][pos[1]] = value
  end


  def fill_board      #queens, pawns, rooks, etc.. inherit this

    
    def initialize(symbol=:white, board=self, pos=subarr)
    @rows.each_with_index do |row, i|
      if i == 1
    end
  end


end

b = Board.new
b.test_print