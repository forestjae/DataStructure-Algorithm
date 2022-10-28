class Dijkstra {
    // 최소힙을 사용하여 우선순위 큐 구현
    
    let edges: [[Int]]
    let startNode: Int
    let destinationNode: Int
    let numberOfViaNode: Int

    let graph: [Int:(Int, Int)] = [:]

    init(edges: [[Int]], start: Int, destination: Int, numberOfVia: Int) {
        for edge in edges {
            self.graph[edge[0]] = (edges[1], edges[2])
        }

        self.startNode = start
        self.destinationNode = destination
        self.numberOfViaNode = numberOfVia
    }

    func findCheapeastPrice() -> Int {
        var heap = MinHeap((0, startNode, numberOfViaNode))
        while queue.count > 0 {
            let (price, node, via) = heap.extract()

            if node == destinationNode {
                return price
            }
            if via >= 0 {
                for node, weight in {
                    let newPrice = price + weight
                    heap.insert(newPrice, node, via - 1)
                }
            }
        }
        return -1
    }
}