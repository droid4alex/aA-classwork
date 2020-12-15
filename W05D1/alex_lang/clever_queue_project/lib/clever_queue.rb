require_relative 'simple_queue'
class CleverQueue < SimpleQueue
  attr_reader :capacity
  attr_accessor :soft_limit
  def initialize(num1, num2)
    @capacity = num1
    @soft_limit = num2
    raise 'invalid args' if @soft_limit > @capacity
    @hidden_array = []
  end
  def enqueue(*args)
    if size + args.length > capacity
      raise 'queue is full'
    else
      args.each do |ele|
        @hidden_array.push(ele)
      end
      return size
    end
  end
  def dequeue(n = 0)
    if n == 0
      return [@hidden_array.shift]
    else
      arr = []
      n.times do |x|
        arr << @hidden_array.shift
      end
      return arr
    end
  end
  def trim
    if size < soft_limit
      return false
    else
      n = size - soft_limit
      n.times do |x|
        @hidden_array.pop
      end
      return true
    end
  end
end