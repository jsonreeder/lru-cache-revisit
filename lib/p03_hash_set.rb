require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    @count += 1
    self[key] << key
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    @count -= 1
    self[key].delete(key)
  end

  private

  def [](key)
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    old_store.each do |bucket|
      bucket.each { |el| insert(el) }
    end
  end
end
