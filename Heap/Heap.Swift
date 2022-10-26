class Heap {
    // 최소 힙 구현

    // 인덱스 0인 노드는 사용하지 않음(직관성을 위해)
    var items: [Int] = [-1]
    
    private func length() -> Int {
        return self.items.count - 1
    }

    /* 삽입
    1. 가장 하위레벨의 가능한 왼쪽에 삽입(배열의 마지막)
    2. 부모 값과 비교해 값이 더 작은 경우 위치 변경(업힙 연산)
    3. 2를 반복한다.
    */ 

    func insert(value: Int) {
        self.items.append(value)
        self.percolateUp()
    }

    private func percolateUp() {
        var i = length()
        var parent = i / 2
        while parent >= 0 {
            if self.items[i] < self.items[parent] {
                let value = self.items[i]
                let parentValue = self.items[parent]
                self.items[i] = parentValue
                self.items[parent] = value
            }
            i = parent
            parent = i / 2
        }
    }
    
    /* 추출
    1. 루트 노드를 추출한다.
    2. 비어있는 루트에 가장 마지막 노드가 들어간다
    3. 자식노드와 값을 비교해서 자식보다 크면 위치변경(다운힙 연산)
    */

    func extract() -> Int {
        let value = self.items[1]
        self.items[1] = self.items[length()]
        self.items.popLast()
        self.percolateDown(index: 1)

        return value
    }

    private func percolateDown(index: Int) {
        let left = index * 2
        let right = index * 2 + 1
        var smallest = index

        if left <= length() && self.items[left] < self.items[smallest] {
            smallest = left
        } 

        if right <= length() && self.items[right] < self.items[smallest] {
            smallest = right
        }  

        if smallest != index {
            let value = self.items[index]
            let smallest = self.items[smallest]
            self.items[index] = smallest
            self.items[smallest] = value

            percolateDown(index: smallest)
        }
    }
}