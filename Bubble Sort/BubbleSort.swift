class BubbleSort {
    func sort(items: [Int]) -> [Int] {
        var newItems = items
        let count = self.items.count

        for i in 0..<count {
            for j in 0..<count-1-i {
                if newItems[j] > newItems[j + 1] {
                    let former = newItems[j]
                    let latter = newItems[j + 1]
                    newItems[j] = latter
                    newItems[j+1] = former
                }
            }
        }

        return newItems
    }
}