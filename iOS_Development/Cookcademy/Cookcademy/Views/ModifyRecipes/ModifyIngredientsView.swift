//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Sean McDonald on 5/18/24.
//

import SwiftUI

struct ModifyIngredientsView: View {
  @Binding var ingredients: [Ingredient]
  @State private var newIngredient = Ingredient(name: "", quantity: 1.0, unit: .none)
  
  var body: some View {
    VStack {
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
