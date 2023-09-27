//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Alex Archer on 8/1/23.
//

import SwiftUI

struct ModifyIngredientView: ModifyComponentView { // Conforming to ModifyComponentView protocol
    @Binding var ingredient: Ingredient // The ingredient being modified
    let createAction: ((Ingredient) -> Void) // Action to create or update the ingredient

    // Custom initializer accepting a binding to an ingredient and the creation action
    init(component: Binding<Ingredient>, createAction: @escaping (Ingredient) -> Void) {
        self._ingredient = component
        self.createAction = createAction
    }

    // Background and text colors from app storage
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    @Environment(\.presentationMode) private var mode // Environment for dismissing the view
    @EnvironmentObject private var recipeData: RecipeData // Shared recipe data

    var body: some View {
        Form {
            TextField("Ingredient Name", text: $ingredient.name)
                .listRowBackground(listBackgroundColor) // Ingredient name input field
            Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
                HStack {
                    Text("Quantity:")
                    TextField("Quantity", value: $ingredient.quantity, formatter: NumberFormatter.decimal)
                        .keyboardType(.numbersAndPunctuation) // Quantity input
                }
            }.listRowBackground(listBackgroundColor)
            Picker(selection: $ingredient.unit, label: HStack {
                Text("Unit")
                Spacer()
                Text(ingredient.unit.rawValue)
            }) {
                ForEach(Ingredient.Unit.allCases, id: \.self) { unit in
                    Text(unit.rawValue) // Picker for selecting unit of measurement
                }
            }
            .listRowBackground(listBackgroundColor)
            .pickerStyle(MenuPickerStyle())
            HStack {
                Spacer()
                Button("Save") {
                    createAction(ingredient) // Executes the save action
                    mode.wrappedValue.dismiss() // Dismisses the view
                }
                Spacer()
            }.listRowBackground(listBackgroundColor)
        }
        .foregroundColor(listTextColor)
    }
}

extension NumberFormatter { // Number formatter for decimal quantity input
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}

struct ModifyIngredientView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[0]
    static var previews: some View {
        NavigationView {
            ModifyIngredientView(component: $recipe.ingredients[0]) { ingredient in
                print(ingredient)
            }.navigationTitle("Add Ingredient")
        }
    }
}
