//
//  Graph.swift
//  Graph
//
//  Created by Alex Archer on 8/25/23.
//

import Foundation

class GraphNode {
    
    var data: String
    // Changed to Dictionary to store weights alongside neighbors
    var neighboringNodes: [GraphNode: Int]
    
    init(data: String) {
        self.data = data
        self.neighboringNodes = [:]
    }
    
    // Check for duplicates before adding
    func addNeighbor(_ newNeighbor: GraphNode, weight: Int? = nil) {
        if neighboringNodes[newNeighbor] == nil {
            neighboringNodes[newNeighbor] = weight
        }
    }
    
    // Optimized removal using Dictionary
    func removeNeighbor(_ nodeToRemove: GraphNode) {
        neighboringNodes[nodeToRemove] = nil
    }
}

extension GraphNode: Hashable {
    func hash(into hasher: inout Hasher) {
        // Use ObjectIdentifier to uniquely identify the object
        hasher.combine(ObjectIdentifier(self))
    }
}

extension GraphNode: Equatable {
    static func == (lhs: GraphNode, rhs: GraphNode) -> Bool {
        return lhs === rhs
    }
}

// Removed GraphEdge as it is now part of GraphNode.neighboringNodes
class Graph {
    
    var nodes: [GraphNode]
    
    init(nodes: [GraphNode]) {
        self.nodes = nodes
    }
    
    // Simpler, faster edge addition using adjacency list
    func addEdge(from nodeOne: GraphNode, to nodeTwo: GraphNode, isBidirectional: Bool = true, weight: Int? = nil) {
        nodeOne.addNeighbor(nodeTwo, weight: weight)
        if isBidirectional {
            nodeTwo.addNeighbor(nodeOne, weight: weight)
        }
    }
    
    // Multiple edges can be added at once
    func addEdges(from nodeOne: GraphNode, to neighboringNodes: [(node: GraphNode, isBidirectional: Bool, weight: Int?)]) {
        for (node, isBidirectional, weight) in neighboringNodes {
            addEdge(from: nodeOne, to: node, isBidirectional: isBidirectional, weight: weight)
        }
    }

    // Removing a node and all associated edges
    func removeNode(_ node: GraphNode) {
        if let index = nodes.firstIndex(where: { $0 == node }) {
            nodes.remove(at: index)
        }
        
        // Remove edges associated with this node
        nodes.forEach { $0.removeNeighbor(node) }
    }
    
    // Displaying the graph
    func printGraph() {
        for node in nodes {
            Swift.print("\(node): \(node.neighboringNodes)")
        }
    }
}
