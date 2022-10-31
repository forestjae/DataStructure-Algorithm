class QuickSort {
    func quickSort(_ array: [Int]) -> [Int] {
        var array = array
        if array.isEmpty {
            return []
        }

        let pivot = array.removeFirst()

        return quickSort(array.filter { $0 <= pivot }) + [pivot] + quickSort(array.filter { $0 > pivot })
    }
}