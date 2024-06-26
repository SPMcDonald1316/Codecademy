//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by Sean McDonald on 5/18/24.
//

import SwiftUI

struct ModifyMainInformationView: View {
  @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
  @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
  
  @Binding var mainInformation: MainInformation
  @EnvironmentObject private var recipeData: RecipeData
  
  var body: some View {
    Form {
      TextField("Recipe Name", text: $mainInformation.name)
        .listRowBackground(listBackgroundColor)
      TextField("Author", text: $mainInformation.author)
        .listRowBackground(listBackgroundColor)
      Section(header: Text("Description")) {
        TextEditor(text: $mainInformation.description)
          .listRowBackground(listBackgroundColor)
      }
      Picker(selection: $mainInformation.category, label:
              HStack {
                Text("Category")
                Spacer()
                Text(mainInformation.category.rawValue)
              }) {
                  ForEach(MainInformation.Category.allCases, id: \.self) {category in
                    Text(category.rawValue)
                  }
              }
              .listRowBackground(listBackgroundColor)
              .pickerStyle(MenuPickerStyle())
      }
      .foregroundColor(listTextColor)
  }
}

struct ModifyMainInformationView_Previews: PreviewProvider {
  @State static var recipe = Recipe()
  static var previews: some View {
    ModifyMainInformationView(mainInformation: $recipe.mainInformation)
  }
}
