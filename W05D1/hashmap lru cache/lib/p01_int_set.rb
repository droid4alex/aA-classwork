class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if is_valid?(num)
      raise 'Out of bounds' 
    else
      @store[num] = true
    end
  end
  
  #verify that num is in range? 
  def include?(num)
    @store[num] if validate!(num)
  end

  #maybe we should check num to make sure
  #it is not out of bounds
  def remove(num)
    @store[num] = false
  end


  private

  def is_valid?(num)
    num < 0 || num > @max
  end

  #ask TA what this is for. 
  def validate!(num)
    num.is_a?(Integer)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].each {|a| return true if a == num}
    false
  end

  private
  def [](num)   #syntactic sugar
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      @store[num % num_buckets] << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
     self[num].include?(num)
  end

  # def count
  #   @store.map{|bucket| bucket.length}.sum
  # end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    if @count == num_buckets
      @store += Array.new(num_buckets)
      # temp_arr = Array.new(num_buckets * 2){Array.new}
      # @store.each do |i|
      #   @store[i].each do |j|

      #   end
      # end
    end
  end
end
