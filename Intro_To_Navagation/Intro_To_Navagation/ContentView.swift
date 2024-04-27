//
//  ContentView.swift
//  Intro_To_Navagation
//
//  Created by Sean McDonald on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Items in Stock")
                    .font(.title)
                    .padding()
                Spacer()
                NavigationLink(
                    destination: ItemDetailView(itemName: "Shrimp Chips"),
                    label: {
                        Text("Shrimp Chips")
                    })
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
