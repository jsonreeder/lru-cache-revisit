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
      # Move to end of list
      update_link!
      # Return Value
    else
      # Call the proc
      val = calc!(key)
      # Eject if max size exceeded
      eject! if count >= @max
      # Return proc output
      val
    end
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

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
  end

  def eject!
  end
end
