fun <T : Comparable<T>> mergeSort(array: MutableList<T>) {
    if (array.size <= 1) return

    val mid = array.size / 2
    val left = array.subList(0, mid).toMutableList()
    val right = array.subList(mid, array.size).toMutableList()

    mergeSort(left)
    mergeSort(right)

    merge(array, left, right)
}

private fun <T : Comparable<T>> merge(array: MutableList<T>, left: MutableList<T>, right: MutableList<T>) {
    var i = 0
    var j = 0
    var k = 0

    while (i < left.size && j < right.size) {
        if (left[i] <= right[j]) {
            array[k] = left[i]
            i++
        } else {
            array[k] = right[j]
            j++
        }
        k++
    }

    while (i < left.size) {
        array[k] = left[i]
        i++
        k++
    }

    while (j < right.size) {
        array[k] = right[j]
        j++
        k++
    }
}

fun main() {
    val unsortedList = mutableListOf(5, 2, 8, 1, 3)
    mergeSort(unsortedList)
    println(unsortedList) // Output: [1, 2, 3, 5, 8]
}