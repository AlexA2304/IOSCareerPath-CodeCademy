//
//  File.swift
//  Module11-Project1-Calculator
//
//  Created by Alex Archer on 8/21/23.
//

/*
 PROJECT DIRECTIONS:
1) Create a new structure Calculator with methods for reduce, map, and filter.
2) Add the reduce(_:using:startingAt) instance method to Calculator, taking an array of Ints, a closure named nextPartialResult, and an Int named initialResult.
3) Inside reduce function, define total, iterate over the array, assign the total with the closure's result, and return total.
4) Create an instance of Calculator to test the reduce function.
5) Define an array of Ints for summation.
6) Define a closure called addition that adds two numbers.
7) Create a constant sum, call reduce method with array, addition and 0, then print the sum.
8) Add filter(_:using) method, taking an array of Ints and a closure named isIncluded that returns a Bool, method should return an array of Ints.
9) Inside filter method, create filteredNums array, iterate over numbers, if isIncluded(num) is true, add to filteredNums, and return filteredNums.
10) Test filtering by defining a new array with some 0s.
11) Call calculator.filter on your array with a closure removing all 0s, then print the new filtered array.
12) Add map(_:using:) method that takes in an array of Ints and a closure named transform, method should return an array of Ints.
13) Inside map function, create mappedNums array, iterate over nums array, pass number into transform closure, append to mappedNums, and return mappedNums.
14) To test mapping, define a new array of Ints.
15) Call calculator.map on your array with a closure to add a number to each array element, then print the new mapped array.
16) Optionally, add a method to sort the contents of an array, enhancing your calculator's functionality.
*/

import Foundation

struct Calculator {

  func reduce(_ nums: [Int], using nextPartialResult: (Int, Int) -> Int, startingAt initialResult: Int) -> Int {
    var total = initialResult
    for num in nums {
      total = nextPartialResult(total, num)
    }
    return total
  }

  func filter(_ nums: [Int], using isIncluded: (Int) -> Bool) -> [Int] {
    var filteredNums: [Int] = []
    for num in nums {
      if isIncluded(num) {
        filteredNums.append(num)
      }
    }
    return filteredNums
  }

  func map(_ nums: [Int], using transform: (Int) -> Int) -> [Int] {
    var mappedNums: [Int] = []
    for num in nums {
      mappedNums.append(transform(num))
    }
    return mappedNums
  }

  func sort(_ nums: [Int]) -> [Int] {
    guard nums.count > 1 else {return nums}

    let pivot = nums[nums.count/2]
    let less = nums.filter { $0 < pivot }
    let equal = nums.filter { $0 == pivot }
    let greater = nums.filter { $0 > pivot}

    return sort(less) + equal + sort(greater)
  }
}

let addition = {(a: Int, b: Int) -> Int in
  return a + b
}

let myInts = [88, 59, 0, 27, 45, 96, 71, 12, 0, 103]
print("Array Input: \(myInts)")
let myCalculator = Calculator()
let sum = myCalculator.reduce(myInts, using: addition, startingAt: 0)
print("The Sum of All List Elements: \(sum)")
let filtered = myCalculator.filter(myInts, using: {num in num != 0})
print("Array Filtered For 0s: \(filtered)")
let mapped = myCalculator.map(myInts, using: {$0 + 10})
print("All Elements + 10: \(mapped)")
let sorted = myCalculator.sort(myInts)
print("Sorted From Small to Large: \(sorted)")
