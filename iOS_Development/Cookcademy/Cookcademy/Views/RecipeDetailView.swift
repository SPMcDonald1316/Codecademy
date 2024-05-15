//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Sean McDonald on 5/14/24.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            HStack {
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack {
                Text(recipe.mainInformation.description)
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            List {
                Section(header: Text("Ingredients")) {
                    ForEach(recipe.ingredients.indices, id: \.self) {index in
                        let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
                    }
                }
                Section(header: Text("Directions")) {
                    ForEach(recipe.directions.indices, id: \.self) { index in
                        let direction = recipe.directions[index]
                        HStack {
                            Text("\(index + 1). ").bold()
                            Text("\(direction.isOptional ? "(Optional) " : "" )"
                                 + "\(direction.description)")
                        }
                    }
                }
            }
        }
        .navigationTitle(recipe.mainInformation.name)
    }
}

#Preview {
    ZStack {
        @State var recipe = Recipe.testRecipes[0]
        NavigationView {
            RecipeDetailView(recipe: recipe)
        }
    }
}
