//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Alex Archer on 8/1/23.
//

import SwiftUI

protocol RecipeComponent: CustomStringConvertible { // Protocol for recipe components
    init()
    static func singularName() -> String
    static func pluralName() -> String
}

extension RecipeComponent { // Default implementations for singular and plural names
    static func singularName() -> String { String(describing: self).lowercased() }
    static func pluralName() -> String { singularName() + "s" }
}

protocol ModifyComponentView: View { // Protocol for views that modify components
    associatedtype Component
    init(component: Binding<Component>, createAction: @escaping (Component) -> Void)
}

struct ModifyComponentsView<Component: RecipeComponent, DestinationView: ModifyComponentView>: View where DestinationView.Component == Component {
    @Binding var components: [Component] // Binding to the array of components

    // Background and text colors from app storage
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground

    @State private var newComponent = Component() // State for a new component
    
    var body: some View {
        VStack {
            // Creating the view for adding a component, with navigation title
            let addComponentView = DestinationView(component: $newComponent) { component in
                components.append(component) // Append the new component
                newComponent = Component() // Reset for the next addition
            }.navigationTitle("Add \(Component.singularName().capitalized)")
            
            if components.isEmpty {
                Spacer()
                NavigationLink("Add the first \(Component.singularName())", destination: addComponentView)
                Spacer() // Navigation link to add the first component
            } else {
                // List of existing components, with edit and delete options
                HStack {
                    Text(Component.pluralName().capitalized)
                        .font(.title)
                        .padding()
                    Spacer()
                    EditButton()
                        .padding()
                }
                List {
                    ForEach(components.indices, id: \.self) { index in
                        let component = components[index]
                        let editComponentView = DestinationView(component: $components[index]) { _ in return }
                            .navigationTitle("Edit \(Component.singularName().capitalized)")
                        NavigationLink(component.description, destination: editComponentView) // Navigation link for editing
                    }
                    .onDelete { components.remove(atOffsets: $0) } // Delete functionality
                    .onMove { indices, newOffet in components.move(fromOffsets: indices, toOffset: newOffet) } // Move functionality
                    .listRowBackground(listBackgroundColor)
                    NavigationLink("Add another \(Component.singularName())",
                                   destination: addComponentView)
                        .buttonStyle(PlainButtonStyle()) // Navigation link for adding more components
                        .listRowBackground(listBackgroundColor)
                }.foregroundColor(listTextColor)
            }
        }
    }
}

struct ModifyComponentsView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[1]
    @State static var emptyIngredients = [Ingredient]()
    
    static var previews: some View {
        NavigationView {
            ModifyComponentsView<Ingredient, ModifyIngredientView>(components: $recipe.ingredients)
        }
        NavigationView {
            ModifyComponentsView<Ingredient, ModifyIngredientView>(components: $emptyIngredients)
        }
      }
}
