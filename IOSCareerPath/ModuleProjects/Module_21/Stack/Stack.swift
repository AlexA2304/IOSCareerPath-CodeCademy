//
//  Stack.swift
//  Stack
//
//  Created by Alex Archer on 8/25/23.
//

import Foundation

// Node class
class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}

// Linked list to serve as the underlying data structure for the stack
class LinkedList<T> {
    var head: Node<T>?
    
    // Add data to the head of the list
    func addToHead(_ data: T) {
        let newHead = Node(data: data)
        newHead.next = head
        head = newHead
    }
    
    // Remove and return the head of the list
    func removeHead() -> Node<T>? {
        guard let removedHead = head else { return nil }
        head = removedHead.next
        removedHead.next = nil
        return removedHead
    }
}

// Stack structure using linked list
struct Stack<T> {
    private var list = LinkedList<T>()
    
    // Check if the stack is empty
    var isEmpty: Bool {
        return list.head == nil
    }
    
    // Add an element to the top of the stack
    mutating func push(_ element: T) {
        list.addToHead(element)
    }
    
    // View the top element of the stack without removing it
    func peek() -> T? {
        return list.head?.data
    }
    
    // Remove and return the top element of the stack
    mutating func pop() -> T? {
        guard let node = list.removeHead() else { return nil }
        return node.data
    }
    
    // Get the size of the stack
    var size: Int {
        var node = list.head
        var count = 0
        while node != nil {
            count += 1
            node = node?.next
        }
        return count
    }
}

var dishes = Stack()
dishes.push("blue plate")
dishes.push("white plate")
dishes.push("yellow plate")
print("Top dish: \(dishes.peek() ?? "Empty list")")
_ = dishes.pop()
_ = dishes.pop()
