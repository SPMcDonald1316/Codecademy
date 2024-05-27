//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Sean McDonald on 5/14/24.
//

import SwiftUI

struct RecipeDetailView: View {
  @Binding var recipe: Recipe
  @State private var isPresenting = false
  
  @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
  @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
  
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
              .foregroundColor(listTextColor)
          }
        }.listRowBackground(listBackgroundColor)
        Section(header: Text("Directions")) {
          ForEach(recipe.directions.indices, id: \.self) { index in
            let direction = recipe.directions[index]
            HStack {
              Text("\(index + 1). ").bold()
              Text("\(direction.isOptional ? "(Optional) " : "" )"
                   + "\(direction.description)")
            }.foregroundColor(listTextColor)
          }
        }.listRowBackground(listBackgroundColor)
      }
    }
    .navigationTitle(recipe.mainInformation.name)
    .toolbar {
      ToolbarItem {
        HStack {
          Button("Edit") {
            isPresenting = true
          }
          Button(action: {
            recipe.isFavorite.toggle()
          }) {
            Image(systemName: recipe.isFavorite ? "heart.fill" : "heart")
          }
        }
      }
    }
    .sheet(isPresented: $isPresenting) {
      NavigationView {
        ModifyRecipeView(recipe: $recipe)
          .toolbar {
            ToolbarItem(placement: .confirmationAction) {
              Button("Save") {
                isPresenting = false
              }
            }
          }
          .navigationTitle("Edit Recipe")
      }
    }
  }
}

#Preview {
    @State var recipe = Recipe.testRecipes[0]
    return NavigationView {
      RecipeDetailView(recipe: $recipe)
  }
}
