//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Sean McDonald on 5/18/24.
//

import SwiftUI

struct ModifyIngredientsView: View {
  @Binding var ingredients: [Ingredient]
  @State private var newIngredient = Ingredient()
  
  var body: some View {
    VStack {
      let addIngredientView = ModifyIngredientView(ingredient: $newIngredient) { ingredient in
        ingredients.append(ingredient)
        newIngredient = Ingredient(name: "", quantity: 0.0, unit: .none)
      }.navigationTitle("Add Ingredient")
      if ingredients.isEmpty {
        Spacer()
        NavigationLink("Add the first ingredient",
                       destination: ModifyIngredientView(ingredient: $newIngredient))
        Spacer()
      } else {
        List {
          ForEach(ingredients.indices, id: \.self) {index in
            let ingredient = ingredients[index]
            Text(ingredient.description)
          }
          NavigationLink("Add another ingredient",
                         destination: ModifyIngredientView(ingredient: $newIngredient))
          .buttonStyle(PlainButtonStyle())
        }
      }
    }
  }
}

#Preview {
  @State var emptyIngredients = [Ingredient]()
  return ModifyIngredientsView(ingredients: $emptyIngredients)
}
