require_relative 'p04_linked_list'
require 'byebug'

class HashMap
  attr_accessor :count
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    return false if get(key).nil?
    true
  end

  def set(key, val)
    # debugger
    @store[key.hash % num_buckets].append(key, val)
  end

  def [](key)
    get(key)
  end

  def []=(key,val)
    debugger
    if include?(key)
      @store[key.hash % num_buckets].update(key, val)
    else
      set(key, val)
    end
  end

  def get(key)
    @store[key.hash % num_buckets].get(key)
  end

  def delete(key)
  end

  def each
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
