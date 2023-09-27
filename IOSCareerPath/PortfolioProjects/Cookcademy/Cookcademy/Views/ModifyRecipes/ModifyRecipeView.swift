//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Alex Archer on 7/31/23.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe // A binding to the recipe that will be modified

    @State private var selection = Selection.main // State to track the selected recipe component

    var body: some View {
        VStack {
            Picker("Select recipe component", selection: $selection) {
                // picker for choosing between main info, ingredients, or directions
                Text("Main Info").tag(Selection.main)
                Text("Ingredients").tag(Selection.ingredients)
                Text("Directions").tag(Selection.directions)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            switch selection {
            case .main:
                ModifyMainInformationView(mainInformation: $recipe.mainInformation) // Shows the view for modifying main information
            case .ingredients:
                ModifyComponentsView<Ingredient, ModifyIngredientView>(components: $recipe.ingredients) // Shows the view for modifying ingredients
            case .directions:
                ModifyComponentsView<Direction, ModifyDirectionView>(components: $recipe.directions) // Shows the view for modifying directions
            }
            Spacer()
        }
    }
    
    enum Selection {
        case main
        case ingredients
        case directions
    } // Enum to represent the different sections that can be modified
}

struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe()
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
}
