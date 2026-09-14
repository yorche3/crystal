module NaiveSort
    # selection_sort sorts an array of Int32 using the selection sort algorithm.
    # input: an array of Int32
    # out: a sorted array of Int32
    def self.selection_sort(arr : Array(Int32)) : Array(Int32)
      return arr if arr.size <= 1

      n = arr.size
      (0...n-1).each do |i|
        min_index = i
        ((i+1)...n).each do |j|
          min_index = j if arr[j] < arr[min_index]
        end
        arr[i], arr[min_index] = arr[min_index], arr[i] if min_index != i
      end

      return arr
    end

    # bubble_sort sorts an array of Int32 using the bubble sort algorithm.
    # input: an array of Int32
    # out: a sorted array of Int32
    def self.bubble_sort(arr : Array(Int32)) : Array(Int32)
      return arr if arr.size <= 1

      n = arr.size
      loop do
        swapped = false
        (0...(n-1)).each do |i|
          if arr[i] > arr[i+1]
            arr[i], arr[i+1] = arr[i+1], arr[i]
            swapped = true
          end
        end
        break unless swapped
      end

      return arr
    end

    # insertion_sort sorts an array of Int32 using the insertion sort algorithm.
    # input: an array of Int32
    # out: a sorted array of Int32
    def self.insertion_sort(arr : Array(Int32)) : Array(Int32)
      return arr if arr.size <= 1

      n = arr.size
      (1...n).each do |i|
        key = arr[i]
        j = i - 1
        while j >= 0 && arr[j] > key
          arr[j + 1] = arr[j]
          j -= 1
        end
        arr[j + 1] = key
      end

      return arr
    end
end