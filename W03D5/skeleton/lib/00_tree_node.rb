class PolyTreeNode

  attr_reader :children, :parent, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent_node)
    #parent: parent_node
    #child: self

    if parent_node == nil
      @parent = nil
      return nil
    end
    @parent.children.delete(self) if @parent != nil
    parent_node.children << self if !parent_node.children.include?(self)
    @parent = parent_node
  end

  
end