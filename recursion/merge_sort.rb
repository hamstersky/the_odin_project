def merge_sort(array)
  return array if array.length == 1
  n = array.length
  left = merge_sort(array[0..n/2 - 1])
  right = merge_sort(array[(n/2)..-1])
  merge(left, right)
end

def merge(left, right, result = [])
  until left.empty? || right.empty?
    result << (left[0] >= right[0] ? right.shift : left.shift)
  end
  result + left + right
end

p merge_sort([3, 4, 2, 7, 10, 1])
