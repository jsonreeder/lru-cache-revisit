class Array
  def hash
    hashed = 0.hash
    each_with_index do |el, idx|
      int = el.is_a?(String) ? el.ord.hash : el.hash
      idx.odd? ? hashed += int : hashed -= int
    end
    hashed
  end
end

class String
  def hash
    chars.hash
  end
end

class Hash
  def hash
    0
  end
end
