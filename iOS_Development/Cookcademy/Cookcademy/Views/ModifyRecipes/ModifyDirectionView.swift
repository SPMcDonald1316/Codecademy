//
//  ModifyDirectionView.swift
//  Cookcademy
//
//  Created by Sean McDonald on 5/26/24.
//

import SwiftUI

struct ModifyDirectionView: ModifyComponentView {
  @Binding var direction: Direction
  let createAction: (Direction) -> Void
  
  init(component: Binding<Direction>, createAction: @escaping (Direction) -> Void) {
    self._direction = component
    self.createAction = createAction
  }
  
  @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
  @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
  
  @Environment(\.presentationMode) private var mode
  
  var body: some View {
    Form {
      TextField("Direction Description", text: $direction.description)
        .listRowBackground(listBackgroundColor)
      Toggle("Optional", isOn: $direction.isOptional)
        .listRowBackground(listBackgroundColor)
      HStack {
        Spacer()
        Button("Save") {
          createAction(direction)
          mode.wrappedValue.dismiss()
        }
        Spacer()
      }.listRowBackground(listBackgroundColor)
    }
    .foregroundColor(listTextColor)
  }
}

#Preview {
  @State var emptyDirection = Direction()
  return NavigationView {
    ModifyDirectionView(component: $emptyDirection) { _ in return}
  }
}
