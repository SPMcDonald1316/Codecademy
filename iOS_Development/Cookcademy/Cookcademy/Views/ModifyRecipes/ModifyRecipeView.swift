//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Sean McDonald on 5/16/24.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        Button("Fill in the recipe with test data.") {
            recipe.mainInformation = MainInformation(name: "test",
                                                     description: "test",
                                                     author: "test",
                                                     category: .breakfast)
            recipe.directions = [Direction(description: "test",
                                          isOptional: false)]
            recipe.ingredients = [Ingredient(name: "test",
                                             quantity: 1.0,
                                             unit: .none)]
        }
    }
}

#Preview {
    @State static var recipe = Recipe()
    ModifyRecipeView(recipe: $recipe)
}