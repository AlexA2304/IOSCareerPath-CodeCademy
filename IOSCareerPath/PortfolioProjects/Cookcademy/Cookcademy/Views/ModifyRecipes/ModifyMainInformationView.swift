//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by Alex Archer on 8/1/23.
//

import SwiftUI

struct ModifyMainInformationView: View {
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background // Gets the background color from app storage
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground // Gets the text color from app storage

    @Binding var mainInformation: MainInformation // A binding to the main information of the recipe
    @EnvironmentObject private var recipeData: RecipeData // Access to the shared recipe data
    
    var body: some View {
        Form {
            // Text fields for modifying the recipe name and author
            TextField("Recipe Name", text: $mainInformation.name)
                .listRowBackground(listBackgroundColor)
            TextField("Author", text: $mainInformation.author)
                .listRowBackground(listBackgroundColor)
            Section(header: Text("Description")) {
                // Text editor for modifying the description
                TextEditor(text: $mainInformation.description)
                    .listRowBackground(listBackgroundColor)
            }
            Picker(selection: $mainInformation.category, label: HStack {
                Text("Category")
                Spacer()
                Text(mainInformation.category.rawValue) // Displays the currently selected category
            }) {
                ForEach(MainInformation.Category.allCases, id: \.self) { category in
                    Text(category.rawValue) // Picker for selecting the recipe's category
                }
            }
            .listRowBackground(listBackgroundColor)
            .pickerStyle(MenuPickerStyle())
        }
        .foregroundColor(listTextColor) // Sets the text color for the entire form
    }
}

struct ModifyMainInformationView_Previews: PreviewProvider {
    @State static var mainInformation = MainInformation(name: "Test Name",
                                                        description: "Test Description",
                                                        author: "Test Author",
                                                        category: .breakfast)
    @State static var emptyInformation = MainInformation(name: "", description: "", author: "", category: .breakfast)
        
    static var previews: some View {
        ModifyMainInformationView(mainInformation: $mainInformation)
        ModifyMainInformationView(mainInformation: $emptyInformation)
    }
}
