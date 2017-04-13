require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      # Get value, move to end of list
      val = update_link!(key)
    else
      # Call the proc
      val = calc!(key)
      # Eject if max size exceeded
      eject! if count >= @max
    end

    # Return found value / calculated value
    val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # Calculate output
    val = @prc.call(key)
    # Save output
    @store.append(key, val)
    @map[key] = @store.last
    # Return output
    val
  end

  def update_link!(key)
    val = @store.get(key)
    @store.remove(key)
    @store.append(key, val)
    val
  end

  def eject!
  end
end
