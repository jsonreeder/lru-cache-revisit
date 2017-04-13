class Array
  def hash
    hashed = 0.hash
    self.each { |el| (el % 2).zero? ? hashed += el : hashed ^= el }
    hashed
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
