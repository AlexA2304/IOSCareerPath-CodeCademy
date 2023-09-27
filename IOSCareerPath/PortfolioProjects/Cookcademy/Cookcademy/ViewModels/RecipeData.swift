//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Alex Archer on 7/30/23.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes // Published recipes array to observe changes
    
    // Function to filter recipes by category
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }

    // Computed property to get favorite recipes
    var favoriteRecipes: [Recipe] {
        recipes.filter { $0.isFavorite }
    }
    
    // Function to add a valid recipe to the list
    func add(recipe: Recipe) {
        if recipe.isValid {
            recipes.append(recipe)
        }
    }
    
    // Function to find the index of a specific recipe by ID
    func index(of recipe: Recipe) -> Int? {
        for i in recipes.indices {
            if recipes[i].id == recipe.id {
                return i
            }
        }
        return nil
    }
}


