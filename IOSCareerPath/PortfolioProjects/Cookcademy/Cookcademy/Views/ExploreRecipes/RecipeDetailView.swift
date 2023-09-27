//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Alex Archer on 7/30/23.
//

import SwiftUI

struct RecipeDetailView: View {
    // Binding to the selected recipe
    @Binding var recipe: Recipe
    
    // AppStorage variables for controlling UI appearance
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    // State variables for handling optional directions and presentation state
    @AppStorage("hideOptionalDirections") private var hideOptionalDirections: Bool = false
    @State private var isPresenting = false
    @EnvironmentObject private var recipeData: RecipeData

    var body: some View {
        VStack {
            // Display the author information
            HStack {
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            // Display the recipe description
            HStack {
                Text(recipe.mainInformation.description)
                    .font(.body)
                    .padding()
                Spacer()
            }
            List {
                // Ingredients section
                Section(header: Text("Ingredients")) {
                    // Loop through ingredients
                    ForEach(recipe.ingredients.indices, id: \.self) { index in
                        let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
                            .foregroundColor(listTextColor)
                    }
                }.listRowBackground(listBackgroundColor)
                // Directions section
                Section(header: Text("Directions")) {
                    // Loop through directions, taking into account optional ones
                    ForEach(recipe.directions.indices, id: \.self) { index in
                        let direction = recipe.directions[index]
                        if direction.isOptional && hideOptionalDirections {
                            EmptyView()
                        } else {
                            HStack {
                                let index = recipe.index(of: direction, excludingOptionalDirections: hideOptionalDirections) ?? 0
                                Text("\(index + 1). ").bold()
                                Text("\(direction.isOptional ? "(Optional) " : "")\(direction.description)")
                            }.foregroundColor(listTextColor)
                        }
                    }
                }.listRowBackground(listBackgroundColor)
            }
        }
        .navigationTitle(recipe.mainInformation.name) // Set the navigation title to the recipe name
        .toolbar {
            // Toolbar item to allow editing and favoriting the recipe
            ToolbarItem {
                HStack {
                    Button("Edit") {
                        isPresenting = true
                    }
                    Button(action: {
                        recipe.isFavorite.toggle()
                    }) {
                        Image(systemName: recipe.isFavorite ? "heart.fill" : "heart")
                    }
                }
            }
            ToolbarItem(placement: .navigationBarLeading) { Text("") }
        }
        .sheet(isPresented: $isPresenting) {
            // Presentation sheet to edit the recipe
            NavigationView {
                ModifyRecipeView(recipe: $recipe)
                    .toolbar {
                        // Toolbar to save the modifications
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                isPresenting = false
                            }
                        }
                    }
                    .navigationTitle("Edit Recipe")
            }
        }
    }
}


struct RecipeDetailView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[0]
    static var previews: some View {
        NavigationView {
            RecipeDetailView(recipe: $recipe)
        }
    }
}

