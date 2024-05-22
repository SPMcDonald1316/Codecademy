//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Sean McDonald on 5/18/24.
//

import SwiftUI

struct ModifyIngredientView: View {
  @Binding var ingredient: Ingredient
  let createAction: ((Ingredient) -> Void)
  
  var body: some View {
    Form {
      TextField("Ingredient Name", text: $ingredient.name)
      Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
        HStack {
          Text("Quantity:")
          TextField("Quantity",
                    value: $ingredient.quantity,
                    formatter: NumberFormatter.decimal)
          .keyboardType(.numbersAndPunctuation)
        }
      }
      Picker(selection: $ingredient.unit, label:
              HStack {
        Text("Unit")
        Spacer()
        Text(ingredient.unit.rawValue)
      }) {
        ForEach(Ingredient.Unit.allCases, id: \.self) { unit in
          Text(unit.rawValue)
        }
      }
      .pickerStyle(MenuPickerStyle())
      HStack {
        Spacer()
        Button("Save") {
          createAction(ingredient)
        }
        Spacer()
      }
    }
  }
}

extension NumberFormatter {
  static var decimal: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter
  }
}

#Preview {
  @State var emptyIngredient = Ingredient(name: "", quantity: 1.0, unit: .none)
  return ModifyIngredientView(ingredient: $emptyIngredient) { ingredient in print(ingredient) }
}
