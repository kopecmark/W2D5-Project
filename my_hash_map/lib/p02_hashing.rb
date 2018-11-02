class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    total = 0
    self.each.with_index {|el, idx| total+= el.hash*(idx+1)}
    total
  end
end

class String
  def hash
    total = 0
    self.chars.each.with_index {|el, idx| total+= el.ord.hash*(idx+1)}
    total
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    total = 0
    self.each {|k, v| total+= (k.to_s.hash + v.hash)}
    total

  end
end
