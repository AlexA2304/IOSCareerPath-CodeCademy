//
//  Pokidex.swift
//  Module7-Project1-Pokidex
//
//  Created by Alex Archer on 8/21/23.
//

/*
 PROJECT DIRECTIONS:
1. Define Pokemon attributes: Pokedex number (0 to 896), name, type (e.g., "Grass"), and abilities (e.g., "Magic Bounce").
2. Create a class named Pokemon with properties .num, .name, .type, and .ability with respective default values.
3. Inside the Pokemon class, create an init() method for customization.
4. Create a Bulbasaur instance with specific property values.
5. Create a Charmander instance with specific property values.
6. Create a Squirtle instance with specific property values.
7. Inside the Pokemon class, create a .displayInfo() method to print property values.
8. Test the .displayInfo() method on the three created instances.
9. Create a GigantamaxPokemon subclass inheriting from Pokemon, with a new .location property.
10. Create an instance of the GigantamaxPokemon class with specific property values.
11. In the subclass, update the init() method to include the new .location property.
12. In the GigantamaxPokemon class, override the .displayInfo() method to include the new .location property.
*/

import Foundation

// Write your code below 🤾‍♂️
class Pokemon {
  var num: Int = 0
  var name: String = ""
  var type: Array<String> = [""]
  var ability: Array<String> = [""]

  init(num: Int, name: String, type: Array<String>, ability: Array<String>) {
    self.num = num
    self.name = name
    self.type = type
    self.ability = ability
  }

  func displayInfo() {
    print("Here are the statistics for \(self.name):")
    print("\(self.name)'s ID: \(self.num)")
    print("\(self.name)'s Type: \(self.type)")
    print("\(self.name)'s Abilities: \(self.ability)")
    print("=========================================")
  }
}

class GigantamaxPokemon: Pokemon {
  var location: String = ""
  init(num: Int, name: String, type: Array<String>, ability: Array<String>, location: String) {
    self.location = location
    super.init(num: num, name: name, type: type, ability: ability)
  }
  override func displayInfo() {
    print("Here are the statistics for \(self.name):")
    print("\(self.name)'s ID: \(self.num)")
    print("\(self.name)'s Type: \(self.type)")
    print("\(self.name)'s Abilities: \(self.ability)")
    print("\(self.name)'s Location: \(self.location)'")
    print("=========================================")
  }
}

let bulbasaur = Pokemon(num: 1, name: "bulbasaur", type: ["Grass 🌱", "Poison 💀"], ability: ["Overgrow"])
let charmander = Pokemon(num: 4, name: "charmander", type: ["Fire 🔥"], ability: ["Blaze"])
let Squirtle = Pokemon(num: 7, name: "Squirtle", type: ["Water 💧"], ability: ["Torrent"])

bulbasaur.displayInfo()
charmander.displayInfo()
Squirtle.displayInfo()

var charizard = GigantamaxPokemon(num: 6, name: "Charizard", type: ["Fire 🔥"], ability: ["Blaze"], location: "Lake of Outrage")

charizard.displayInfo()
