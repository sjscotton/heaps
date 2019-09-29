

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity:
def heap_sort(list)
  heap = heapify(list)
  until heap.empty?
    item = heap.remove()
    list.append(item)
  end
  return list
end

def heapify(list)
  heap = MinHeap.new()
  until list.empty?
    item = list.pop()
    heap.add(item)
  end
  return heap
end
