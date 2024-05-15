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
            
        }
        .navigationTitle("All Recipes")
    }
}

#Preview {
    RecipesListView()
}
