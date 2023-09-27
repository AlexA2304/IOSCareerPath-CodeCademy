//
//  HashTable.swift
//  HashTable
//
//  Created by Alex Archer on 8/25/23.
//

import Foundation

struct HashTable<Key: Hashable, Value> {
    private var buckets: [[(Key, Value)]]
    
    // Initialize the hash table with the given capacity
    public init(capacity: Int) {
        buckets = Array(repeating: [], count: capacity)
    }
    
    // Calculate the index for a given key
    private func index(for key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }
    
    // Subscript to set and get values for a key
    public subscript(key: Key) -> Value? {
        set {
            if let value = newValue {
                update(value: value, for: key)
            } else {
                removeValue(for: key)
            }
        }
        get {
            return value(for: key)
        }
    }
    
    // Get the value for a given key
    private func value(for key: Key) -> Value? {
        let bucketIndex = index(for: key)
        return buckets[bucketIndex].first { $0.0 == key }?.1
    }
    
    // Update the value for a given key
    private mutating func update(value: Value, for key: Key) {
        let bucketIndex = index(for: key)
        if let index = buckets[bucketIndex].firstIndex(where: { $0.0 == key }) {
            buckets[bucketIndex][index].1 = value
        } else {
            buckets[bucketIndex].append((key, value))
        }
    }
    
    // Remove value for a given key
    private mutating func removeValue(for key: Key) {
        let bucketIndex = index(for: key)
        if let index = buckets[bucketIndex].firstIndex(where: { $0.0 == key }) {
            buckets[bucketIndex].remove(at: index)
        }
    }
    
    // Check if a key exists
    public func contains(_ key: Key) -> Bool {
        let bucketIndex = index(for: key)
        return buckets[bucketIndex].contains { $0.0 == key }
    }
    
    // Count the number of items in the hash table
    public var count: Int {
        return buckets.reduce(0) { $0 + $1.count }
    }
}

// Test Cases
var hashTable = HashTable<String, Int>(capacity: 5)

// Test: Add key-value pair
hashTable["one"] = 1
assert(hashTable["one"] == 1)

// Test: Update value for existing key
hashTable["one"] = 11
assert(hashTable["one"] == 11)

// Test: Remove key-value pair
hashTable["one"] = nil
assert(hashTable["one"] == nil)

// Test: Check if key exists
assert(hashTable.contains("one") == false)

// Test: Count the number of items
hashTable["two"] = 2
hashTable["three"] = 3
assert(hashTable.count == 2)
