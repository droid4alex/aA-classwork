require_relative "./skeleton/lib/00_tree_node.rb"

class KnightPathFinder
    
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def self.valid_moves(pos)
        moves = [[2,1], [2,-1], [-2, 1], [-2,-1], [1,2], [1,-2], [-1, 2], [-1,-2]]
        kept_moves = []
        moves.each do |move|
            new_position = [pos[0]+move[0],pos[1]+move[1]]
            kept_moves << new_position if new_position.all? {|el| el <= 7 && el >= 0}
        end
        kept_moves
    end

    def new_move_positions(pos)
        new_positions = KnightPathFinder.valid_moves(pos).reject{|el| @considered_positions.include?(el)}
        @considered_positions += new_positions
        new_positions
    end

end