//
//  File.swift
//  Queue
//
//  Created by Alex Archer on 8/25/23.
//

import Foundation

class Node<T> {
    var data: T         // Data of the node
    var next: Node?     // Reference to the next node

    init(data: T) {     // Initialize node with generic type
        self.data = data
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        return "\(data) -> " + (next?.description ?? "nil")
    }
}

struct Queue<T> {
    var head: Node<T>?  // Head of the queue
    var tail: Node<T>?  // Tail of the queue

    // Peek at the head element without removing it
    func peek() -> T? {
        return head?.data
    }

    // Enqueue element at the end
    mutating func enqueue(_ data: T) {
        let newNode = Node(data: data) // Create new node

        if tail != nil {
            tail?.next = newNode // Link tail to the new node if tail exists
        } else {
            head = newNode      // If no tail, then it's the first element
        }
        
        tail = newNode           // Update the tail reference
    }

    // Dequeue element from the front
    mutating func dequeue() -> T? {
        let removedNode = head?.data
        head = head?.next        // Move head reference to the next node

        if head == nil {         // If last element was removed, update tail
            tail = nil
        }
        return removedNode
    }
    
    // Count the number of elements in the queue
    var count: Int {
        var node = head
        var count = 0

        while node != nil {
            count += 1
            node = node?.next
        }

        return count
    }

    // Check if the queue is empty
    var isEmpty: Bool {
        return head == nil
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        guard let firstNode = head else { return "Nothing in the queue" }
        return "(Front) \(firstNode) (Back)"
    }
}

var myQueue = Queue()
print(myQueue)
