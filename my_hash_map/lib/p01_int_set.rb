require 'byebug'

class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max) {false}
  end

  def insert(num)
    raise "Out of bounds" if num > @max - 1 || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    # debugger
    @store[num % @num_buckets] << num
    true
  end

  def remove(num)
    @store[num % @num_buckets].delete(num)
  end

  def include?(num)
    return true if @store[num % @num_buckets].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
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
    resize! if @count == num_buckets

    unless include?(num)
      @store[num % num_buckets] << num
      @count += 1
    end
    # @count
  end

  def remove(num)
    if include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store
    @store = Array.new(count * 2) { Array.new }
    temp.each do |arr|
      arr.each do |el|
        @store[el % num_buckets] << el
      end
    end

  end
end
