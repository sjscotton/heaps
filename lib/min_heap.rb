class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap
  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: ?
  # Space Complexity: ?

  def add(key, value = key)
    @store.append(HeapNode.new(key, value))
    curr = @store.length - 1

    curr = heap_up(curr)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    return if @store.empty?
    last = @store.length - 1
    curr = 0
    swap(last, curr)
    removed = @store.pop
    heap_down(curr)
    return removed.value
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"

    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    until index == 0 || @store[index].key >= @store[((index - 1) / 2)].key
      parent = (index - 1) / 2
      swap(parent, index) if @store[parent].key > @store[index].key
      index = parent
    end
  end

  # This helper method takes an index and
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    until (index * 2 + 1) > @store.length - 1
      left = index * 2 + 1
      right = index * 2 + 2
      if right > @store.length - 1
        child = left
      else
        child = @store[left].key < @store[right].key ? left : right
      end
      @store[index].key > @store[child].key ? swap(index, child) : return
    end
    return
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
