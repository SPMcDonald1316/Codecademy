//
//  ContentView.swift
//  AddressBook
//
//  Created by Ben Stone 3/3/21.
//  Code written and completed by Sean McDonald following iOS Development path on Codecademy.


import SwiftUI

struct AddressBookView: View {
    @StateObject private var viewModel = AddressBookViewModel()
    
    @State private var displayFavoriteCount = true
    
    var body: some View {
        VStack {
            Text("Address Book")
                .font(.title)
                .padding()
            Spacer()
            ContactsView()
                .environmentObject(viewModel)
            Spacer()
            if displayFavoriteCount {
                HStack {
                    Text("You have \(viewModel.favoritedContactCount) favorite" + (viewModel.favoritedContactCount != 1 ? "s" : ""))
                        .padding()
                    Spacer()
                }
            }
            Toggle("Display number of favorites", isOn: $displayFavoriteCount)
                .padding()
        }
        .background(Color(red: 254/255, green: 240/255, blue: 229/255).ignoresSafeArea())
    }
}

#Preview {
    AddressBookView()
}
