

# This method uses a heap to sort an array.
# Time Complexity:  0(n log n) where n is the length of the list. heapify iterates through the list and for each calls add() which is 0(log n) so thats n log n for heapify, heap sort is the same, n log n. So total its 0(2 * nlogn) which reduces to n log n
# Space Complexity: 0(1), we create a new heap, but each time we add one, we remove one from the list. and then westart moving items one at a time back to the list. the length of the heap and the length of the list combined are always equal to the original list size, so we dont actually use any extra space.
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
