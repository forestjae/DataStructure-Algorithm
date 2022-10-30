class MergeSort {
    func mergeSort(array: [Int]) -> [Int] {
        // 원소가 1이하가 될때 까지 재귀하여 나누는 작업
        if array.count <= 1 {
            return array
        }
        let left = Array(array[0..<(array.count / 2)])
        let right = Array(array[array.count/2..<array.count])

        // 전부 분할된 후 백트래킹하여 정렬되면서 최종 정렬된 배열 반환
        return self.mergeAndSort(self.mergeSort(array: left), self.mergeSort(array: right))
    }

    // 분할된 요소들을 정렬하면서 합침
    private func mergeAndSort(left: [Int], right: [Int]) -> [Int] {
        var left = left
        var right = right
        var mergedArray = Array<Int>()

        while !left.isEmpty && !right.isEmpty > 0 {
            if left[0] < right[0] {
                mergedArray.append(left.removeFirst())
            } else {
                mergedArray.append(right.removeFirst())
            }
        }

        if !left.isEmpty {
            mergedArray += left
        }

        if !right.isEmpty {
            mergedArray += right
        }

        return mergedArray
    }
}