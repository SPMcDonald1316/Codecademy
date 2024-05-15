//
//  RecipesListView.swift
//  Cookcademy
//
//  Created by Sean McDonald on 5/13/24.
//

import SwiftUI

struct RecipesListView: View {
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        List {
            ForEach(recipeData.recipes) { recipe in
                Text(recipe.mainInformation.name)
            }
        }
        .navigationTitle("All Recipes")
    }
}

#Preview {
    NavigationView {
        RecipesListView()
    }
}
