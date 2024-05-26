//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Sean McDonald on 5/18/24.
//

import SwiftUI

struct ModifyIngredientView: ModifyComponentView {
  @Binding var ingredient: Ingredient
  let createAction: ((Ingredient) -> Void)
  
  init(component: Binding<Ingredient>, createAction: @escaping (Ingredient) -> Void) {
    self._ingredient = component
    self.createAction = createAction
  }
  
  private let listBackgroundColor = AppColor.background
  private let listTextColor = AppColor.foreground
  
  @Environment(\.presentationMode) private var mode
  
  var body: some View {
    Form {
      TextField("Ingredient Name", text: $ingredient.name)
        .listRowBackground(listBackgroundColor)
      Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
        HStack {
          Text("Quantity:")
          TextField("Quantity",
                    value: $ingredient.quantity,
                    formatter: NumberFormatter.decimal)
          .keyboardType(.numbersAndPunctuation)
        }
      }.listRowBackground(listBackgroundColor)
      Picker(selection: $ingredient.unit, label:
              HStack {
        Text("Unit")
        Spacer()
        Text(ingredient.unit.rawValue)
      }) {
        ForEach(Ingredient.Unit.allCases, id: \.self) { unit in
          Text(unit.rawValue)
        }
      }.listRowBackground(listBackgroundColor)
      .pickerStyle(MenuPickerStyle())
      HStack {
        Spacer()
        Button("Save") {
          createAction(ingredient)
          mode.wrappedValue.dismiss()
        }
        Spacer()
      }.listRowBackground(listBackgroundColor)
    }
    .foregroundColor(listTextColor)
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
  @State var emptyIngredient = Ingredient()
  return ModifyIngredientView(ingredient: $emptyIngredient) { ingredient in print(ingredient) }
}
