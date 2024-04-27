//
//  ItemDetailView.swift
//  Intro_To_Navagation
//
//  Created by Sean McDonald on 4/26/24.
//

import SwiftUI

struct ItemDetailView: View {
    @State var quantityRemaining = Int.random(in: 1...10)
    let itemName: String
    
    var body: some View {
        VStack {
            Text("\(itemName)")
                .font(.title)
                .padding()
            Spacer()
            Image(systemName: "photo")
                .font(.system(size: 200))
                .padding()
            Text("Quantity Remaining: \(quantityRemaining)")
            Spacer()
            Button {
                if quantityRemaining > 0 {
                    quantityRemaining -= 1
                }
            } label: {
                Text("Add one to your cart")
            }
            Spacer()
        }
    }
}

#Preview {
    ItemDetailView(itemName: "Test Item")
}
