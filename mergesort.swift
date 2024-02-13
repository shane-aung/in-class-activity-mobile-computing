func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
  guard array.count > 1 else { return array } // Base case: already sorted

  let midIndex = array.count / 2
  let left = mergeSort(Array(array[0..<midIndex]))
  let right = mergeSort(Array(array[midIndex..<array.count]))

  return merge(left, right)
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
  var merged: [T] = []
  var leftIndex = 0
  var rightIndex = 0

  while leftIndex < left.count && rightIndex < right.count {
    if left[leftIndex] < right[rightIndex] {
      merged.append(left[leftIndex])
      leftIndex += 1
    } else {
      merged.append(right[rightIndex])
      rightIndex += 1
    }
  }

  merged.append(contentsOf: left[leftIndex..<left.count])
  merged.append(contentsOf: right[rightIndex..<right.count])

  return merged
}

// Example usage
let unsortedArray = [5, 2, 8, 1, 3]
let sortedArray = mergeSort(unsortedArray)
print(sortedArray) // Output: [1, 2, 3, 5, 8]