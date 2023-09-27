//
//  MainTabView.swift
//  Cookcademy
//
//  Created by Alex Archer on 8/5/23.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var recipeData = RecipeData() // Data for recipes

    var body: some View {
        TabView {
            RecipeCategoryGridView()
                .tabItem { Label("Recipes", systemImage: "list.dash") } // Recipes tab
            NavigationView {
                RecipesListView(viewStyle: .favorites)
            }.tabItem { Label("Favorites", systemImage: "heart.fill") } // Favorites tab
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gear") } // Settings tab
        }
        .environmentObject(recipeData) // Injecting the recipe data
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
