//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Sean McDonald on 5/18/24.
//

import SwiftUI

protocol RecipeComponent {
  init()
}

protocol ModifyComponentView: View {
  associatedtype Component
  init(component: Binding<Component>, createAction: @escaping(Component) -> Void)
}

struct ModifyComponentsView: View {
  @Binding var ingredients: [Ingredient]
  @State private var newIngredient = Ingredient()
  
  private let listBackgroundColor = AppColor.background
  private let listTextColor = AppColor.foreground
  
  var body: some View {
    VStack {
      let addIngredientView = ModifyIngredientView(ingredient: $newIngredient) { ingredient in
        ingredients.append(ingredient)
        newIngredient = Ingredient()
      }.navigationTitle("Add Ingredient")
      if ingredients.isEmpty {
        Spacer()
        NavigationLink("Add the first ingredient", destination: addIngredientView)
        Spacer()
      } else {
        List {
          ForEach(ingredients.indices, id: \.self) { index in
            let ingredient = ingredients[index]
            Text(ingredient.description)
          }
          .listRowBackground(listBackgroundColor)
          NavigationLink("Add another ingredient",
                         destination: addIngredientView)
          .buttonStyle(PlainButtonStyle())
          .listRowBackground(listBackgroundColor)
        }.foregroundColor(listTextColor)
      }
    }
  }
}

#Preview {
  @State var emptyIngredients = [Ingredient]()
  return ModifyComponentsView(ingredients: $emptyIngredients)
}
