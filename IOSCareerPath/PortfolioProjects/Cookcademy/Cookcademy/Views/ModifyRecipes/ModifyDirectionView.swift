//
//  ModifyDirectionView.swift
//  Cookcademy
//
//  Created by Alex Archer on 8/4/23.
//

import SwiftUI

struct ModifyDirectionView: ModifyComponentView { // Conforming to ModifyComponentView protocol
    @Binding var direction: Direction // Direction being modified
    let createAction: (Direction) -> Void // Action to create or update the direction

    // Custom initializer for binding to a direction and action
    init(component: Binding<Direction>, createAction: @escaping (Direction) -> Void) {
        self._direction = component
        self.createAction = createAction
    }

    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground

    @Environment(\.presentationMode) private var mode // For dismissing the view
    @EnvironmentObject private var recipeData: RecipeData // Shared recipe data

    var body: some View {
        Form {
            TextField("Direction Description", text: $direction.description) // Direction description input field
                .listRowBackground(listBackgroundColor)
            Toggle("Optional", isOn: $direction.isOptional) // Toggle for marking direction as optional
                .listRowBackground(listBackgroundColor)
            HStack {
                Spacer()
                Button("Save") {
                    createAction(direction) // Execute the save action
                    mode.wrappedValue.dismiss() // Dismiss the view
                }
                Spacer()
            }.listRowBackground(listBackgroundColor)
        }
        .foregroundColor(listTextColor)
    }
}

struct ModifyDirectionView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[0]
    
    static var previews: some View {
        NavigationView {
            ModifyDirectionView(component: $recipe.directions[0]) { direction in print(direction)
            }
        }
    }
}
