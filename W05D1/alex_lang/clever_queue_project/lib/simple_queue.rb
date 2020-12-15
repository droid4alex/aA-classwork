class SimpleQueue
  def initialize
    @hidden_array = []
  end
  def size
    @hidden_array.length
  end
  def vacant?
    if size == 0
      return true
    else
      return false
    end
  end
  def front
    @hidden_array[0]
  end
  def back
    @hidden_array[-1]
  end
  def first(n)
    arr = []
    (0...n).each do |i|
      arr << @hidden_array[i]
    end
    arr
  end
  def last(n)
    arr = []
    (@hidden_array.length-n...@hidden_array.length).each do |i|
      arr << @hidden_array[i]
    end
    arr
  end
  def enqueue(item)
    @hidden_array.push(item)
    @hidden_array.length
  end
  def dequeue
    return nil if @hidden_array.empty?
    @hidden_array.shift
  end
  private
  attr_accessor :hidden_array
end