//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Alex Archer on 7/31/23.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    // Environment object to access recipe data
    @EnvironmentObject private var recipeData: RecipeData

    var body: some View {
        // Define grid columns
        let columns = [GridItem(), GridItem()]
        NavigationView {
            ScrollView {
                // Grid to display categories
                LazyVGrid(columns: columns, content: {
                    // Loop through each category
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in
                        // Navigation link to individual category
                        NavigationLink(
                            destination: RecipesListView(viewStyle: .singleCategory(category)),
                            label: {
                                // Custom category view
                                CategoryView(category: category)
                            })
                    }
                })
            }
            .navigationTitle("Categories") // Title for the navigation bar
        }
    }
}

// Custom view for a single category
struct CategoryView: View {
    // Variable to hold category details
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            // Background image with opacity for aesthetic appeal
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.35)
            // Category title overlaid on the image
            Text(category.rawValue)
                .font(.title)
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView()
    }
}

