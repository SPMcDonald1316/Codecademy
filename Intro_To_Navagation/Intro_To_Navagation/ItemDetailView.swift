//
//  ItemDetailView.swift
//  Intro_To_Navagation
//
//  Created by Sean McDonald on 4/26/24.
//

import SwiftUI

struct ItemDetailView: View {
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
            Text("Quantity Remaining: 3")
            Spacer()
            Button {
                print("Button tapped")
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
