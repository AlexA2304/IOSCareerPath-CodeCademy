//
//  Tree.swift
//  Tree
//
//  Created by Alex Archer on 8/25/23.
//

import Foundation

// Represents a node in a tree data structure
class TreeNode<T: Equatable>: Equatable, CustomStringConvertible {
    
    var data: T
    var children: [TreeNode]
    var parent: TreeNode?
    
    // Initialize a TreeNode with data
    init(data: T) {
        self.data = data
        self.children = []
    }
    
    // Initialize a TreeNode with data and children
    init(data: T, children: [TreeNode]) {
        self.data = data
        self.children = children
    }
    
    // Add a child node to the current node
    func addChild(_ newChild: TreeNode) {
        newChild.parent = self
        children.append(newChild)
    }
    
    // Add a child node with a specified data value
    func addChild(newChildData: T) {
        children.append(TreeNode(data: newChildData))
    }
    
    // Add multiple children nodes to the current node
    func addChildren(_ newChildren: [TreeNode]) {
        children.append(contentsOf: newChildren)
    }
    
    // Remove a specific child node
    func removeChild(_ nodeToRemove: TreeNode) {
        // Removing child if found in children array
        if let index = children.firstIndex(of: nodeToRemove) {
            children.remove(at: index)
        }
        // If not found, recursively look in sub-trees
        else {
            for child in children {
                child.removeChild(nodeToRemove)
            }
        }
    }
    
    // Equatable Protocol
    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.data == rhs.data && lhs.children == rhs.children
    }
    
    // CustomStringConvertible Protocol
    var description: String {
        return "\(data)"
    }
}

// Represents a tree data structure
class Tree<T: Equatable> {
    var root: TreeNode<T>
    
    // Initialize a tree with root node
    init(root: TreeNode<T>) {
        self.root = root
    }
    
    // Print tree starting from root
    func print() {
        printFrom(root)
    }
    
    // Recursive helper function to print tree
    func printFrom(_ currentNode: TreeNode<T>, _ depth: Int = 0) {
        let depthMarker = String(repeating: "--|", count: depth)
        Swift.print("\(depthMarker)\(currentNode)")
        for child in currentNode.children {
            printFrom(child, depth + 1)
        }
    }
    
    // Find a node in tree
    func find(matchingNode: TreeNode<T>) -> TreeNode<T>? {
        return find(matchingNode: matchingNode, root)
    }
    
    // Recursive helper function to find a node in tree
    private func find(matchingNode: TreeNode<T>, _ currentNode: TreeNode<T>) -> TreeNode<T>? {
        if matchingNode == currentNode {
            return currentNode
        }
        for child in currentNode.children {
            if let found = find(matchingNode: matchingNode, child) {
                return found
            }
        }
        return nil
    }
    
    // Depth-first traversal of tree
    func depthFirstTraversal(startingAtNode: TreeNode<T>) {
        Swift.print("\(startingAtNode) ", terminator: "")
        for child in startingAtNode.children {
            depthFirstTraversal(startingAtNode: child)
        }
    }
    
    // Breadth-first traversal of tree
    func breadthFirstTraversal(startingAtNode: TreeNode<T>) {
        var queue = [TreeNode<T>]()
        queue.append(startingAtNode)
        while !queue.isEmpty {
            let currentNode = queue.removeFirst()
            Swift.print("\(currentNode) ", terminator: "")
            queue.append(contentsOf: currentNode.children)
        }
    }
}
