//
//  Nodes.swift
//  Nodes
//
//  Created by Alex Archer on 8/25/23.
//
import Foundation

class Node {
    var data: String
    var next: Node?

    init(data: String) {
        self.data = data
    }
}

func main() {
    var strawberry = Node(data: "Berry Tasty")
    var banana = Node(data: "Banana-rama")
    var coconut = Node(data: "Nuts for Coconut")

    strawberry.next = banana
    banana.next = coconut

    // Function to print all nodes recursively
    func printAllNodesRecursively(startingAt node: Node?) {
        guard let node = node else {
            return
        }
        print(node.data)
        printAllNodesRecursively(startingAt: node.next)
    }

    printAllNodesRecursively(startingAt: strawberry)
}
