#!/usr/bin/env ruby

class Array
  def find_rotated_index(searching_element)
    binary_search_rotated(0, length - 1, searching_element)
  end

  private
    def binary_search_rotated(start_index, last_index, searching_element)
      return if(start_index > last_index)

      mid = (start_index + last_index) >> 1

      return mid if self[mid] == searching_element

      if self[mid] >= self[start_index] # left half of rotated array is sorted
        # element lies in the left portion
        if (self[start_index] <= searching_element) && (searching_element <= self[mid])
          binary_search_rotated(start_index, mid - 1, searching_element)
        else
          binary_search_rotated(mid + 1, last_index, searching_element)
        end
      else
        if (self[mid] <= searching_element) && (searching_element <= self[last_index])
          binary_search_rotated(mid + 1, last_index, searching_element)
        else
          binary_search_rotated(start_index, mid - 1, searching_element)
        end
      end
    end
end

if __FILE__ == $0
  puts [100, 1, 3, 5, 9, 15].find_rotated_index 1
  puts [6, 7, 1, 2, 3, 4, 5].find_rotated_index 7
end
