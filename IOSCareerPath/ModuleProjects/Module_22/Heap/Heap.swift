//
//  Heap.swift
//  Heap
//
//  Created by Alex Archer on 8/25/23.
//

import Foundation

class MinHeap {
    
    private var heap: [TaskNode]  // Array-based representation of the heap
    
    init() {
        self.heap = []
    }
    
    // Adds a task to the heap
    func add(task: String, dueDate: Date) {
        let taskNode = TaskNode(task, dueDate)
        heap.append(taskNode)  // Append to the last
        heapifyUp()  // Fix the heap property if violated
    }
    
    // Allows the user to see the next task without removing it
    func getTask() -> TaskNode? {
        return heap.first
    }
    
    // Removes the minimum (root) from the heap and reorganizes it
    func finishTask() -> TaskNode? {
        guard !heap.isEmpty else {
            return nil
        }
        heap.swapAt(0, heap.count - 1)  // Swap root with last
        let removed = heap.removeLast()  // Remove last element (previous root)
        heapifyDown()  // Fix the heap property if violated
        return removed
    }
    
    // Heapify-up procedure to maintain min-heap property
    private func heapifyUp() {
        var currentIndex = heap.count - 1
        while currentIndex > 0, heap[currentIndex] < heap[parentIndex(of: currentIndex)] {
            heap.swapAt(currentIndex, parentIndex(of: currentIndex))  // Swap if child is smaller than parent
            currentIndex = parentIndex(of: currentIndex)  // Move up the tree
        }
    }
    
    // Heapify-down procedure to maintain min-heap property
    private func heapifyDown() {
        var currentIndex = 0
        var toSwap = hasOlderChildren(currentIndex)  // Check if parent needs to swap with children
        while toSwap.needsToSwap {
            heap.swapAt(currentIndex, toSwap.olderChildIndex)  // Swap parent with the smallest child
            currentIndex = toSwap.olderChildIndex
            toSwap = hasOlderChildren(currentIndex)  // Check again for the new subtree
        }
    }
    
    // Determines if a parent has children to swap with
    private func hasOlderChildren(_ currentIndex: Int) -> (needsToSwap: Bool, olderChildIndex: Int) {
        var needsToSwap = false
        var olderChildIndex = 0  // Initialize to invalid index
        
        let leftChildIndex = findLeftChildIndex(of: currentIndex)
        let rightChildIndex = findRightChildIndex(of: currentIndex)
        
        if indexExists(leftChildIndex), heap[currentIndex] > heap[leftChildIndex] {
            needsToSwap = true
            olderChildIndex = leftChildIndex
        }
        
        // Compare right child only if it's smaller than the left child
        if indexExists(rightChildIndex), heap[currentIndex] > heap[rightChildIndex], heap[rightChildIndex] < heap[leftChildIndex] {
            needsToSwap = true
            olderChildIndex = rightChildIndex
        }
        
        return (needsToSwap, olderChildIndex)
    }
    
    // Helper functions to find parent and child indices
    private func findLeftChildIndex(of index: Int) -> Int { return 2 * index + 1 }
    private func findRightChildIndex(of index: Int) -> Int { return 2 * index + 2 }
    private func parentIndex(of index: Int) -> Int { return (index - 1) / 2 }
    private func indexExists(_ index: Int) -> Bool { return index < heap.count }
}

// Conform to CustomStringConvertible to print the heap
extension MinHeap: CustomStringConvertible {
    var description: String {
        var text = "Total outstanding tasks: \(heap.count)\n"
        for (index, task) in heap.enumerated() {
            text += "\(index + 1): \(task)\n"
        }
        return text
    }
}

// Internal class to represent a task node
class TaskNode {
    private let dueDate: Date
    private let task: String
    
    init(_ task: String, _ dueDate: Date) {
        self.dueDate = dueDate
        self.task = task
    }
    
    func getTask() -> String {
        return task
    }
}

// Make TaskNode Comparable based on its dueDate and define CustomStringConvertible
extension TaskNode: Comparable, CustomStringConvertible {
    static func < (lhs: TaskNode, rhs: TaskNode) -> Bool {
        return lhs.dueDate < rhs.dueDate
    }

    static func == (lhs: TaskNode, rhs: TaskNode) -> Bool {
        return lhs.dueDate == rhs.dueDate && lhs.task == rhs.task
    }
    
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        return dueDate < Date() ? "LATE: \(task), Due: \(dateFormatter.string(from: dueDate))" : "\(task), Due: \(dateFormatter.string(from: dueDate))"
    }
}
