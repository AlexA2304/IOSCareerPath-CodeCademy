//
//  GreenThumb.swift
//  Module11-Project3-GreenThumb
//
//  Created by Alex Archer on 8/21/23.
//

/*
 PROJECT DIRECTIONS
1) Define an Enum, Month, with the names of the 12 months.
2) Define a protocol, Plantable, with properties plantMonth of type Month and plantingInstructions of type String.
3) Define a Waterable protocol with properties: inchesOfWater (Int), wateringFrequency (String), and wateringInstructions (String).
4) Define a Harvestable protocol with properties: harvestMonth (Month) and harvestingInstructions (String).
5) Define a Gardenable protocol inheriting from the previous protocols and add a function, printGardeningTips(), with no arguments or return values.
6) Add a default implementation of printGardeningTips() with a specific print statement and any additional gardening tips.
7) Define a struct, Kale, conforming to Gardenable with specific values for plantMonth (.september) and plantingInstructions.
8) Implement the Waterable requirements for Kale, using given values for inchesOfWater, frequency, and wateringInstructions.
9) Set the values for harvestMonth and harvestingInstructions for Kale based on a 60-day harvest time.
10) Create a generic function printTips() to display gardening tips for each Gardenable instance.
11) Create a Kale instance, put it into an array called vegetables, and call printTips() with vegetables as the argument. Observe the output.
12) Excellent work! Experiment with different structs and/or classes and expand on the code as desired.
*/

import Foundation

// Write your code here 🪴
enum Month {
  case january, february, march, april, may, june, july, august, september, october, november, december
}

protocol Plantable {
  var plantMonth: Month { get }
  var plantingInstructions: String { get }
}

protocol Waterable {
  var inchesOfWater: Int { get }
  var wateringFrequency: String { get }
  var wateringInstructions: String { get }
}

protocol Harvestable {
  var harvestMonth: Month { get }
  var harvestingInstructions: String { get }
}

protocol Gardenable: Plantable, Waterable, Harvestable {
  func printGardeningTips()
}

extension Gardenable {
  func printGardeningTips() {
      print("Follow these Gardening 101 tips for a bountiful harvest.")
      print("1) Make sure you always water your plant the exact amount that it needs. \(self.wateringInstructions).")
      print("//----------------")
      print("2) Make sure you know what zone that you're planting in to ensure that the plants you're planting are in their optimal environment.\(self.plantingInstructions)")
          print("//----------------")
      print("3) Make sure you give your plant enough time to grow and are harvesting in the right season. \(self.harvestingInstructions)")
  }
}

struct Kale: Gardenable {
  // Plantable Protocol
  var plantMonth: Month = .september
  var plantingInstructions: String = "Kale should be planted 6 to 8 weeks before the first frost in in-ground gardens, raised beds, or containers."
  // Waterable Protocol
  var inchesOfWater: Int = 2
  var wateringFrequency: String = "weekly"
  var wateringInstructions: String = "Kale needs to be watered 2 inches of water weekly."
  // Harvestable Protocol
  var harvestMonth: Month = .november
  var harvestingInstructions: String { "Kale should be harvested in \(self.harvestMonth)." }
  
}

func printTips<T: Gardenable>(for plants: [T]) {
  for plant in plants {
    plant.printGardeningTips()
  }
}

let vegitables = [Kale()]
printTips(for: vegitables)
