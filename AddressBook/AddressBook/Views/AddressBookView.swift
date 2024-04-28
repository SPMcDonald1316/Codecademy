//
//  ContentView.swift
//  AddressBook
//
//  Originally Created by Ben Stone (Codecademy)
//  All code written and completed by Sean McDonald following iOS Development tutorial on Codecademy.


import SwiftUI

struct AddressBookView: View {
    private var viewModel = AddressBookViewModel()
    
    private var displayFavoriteCount = true
    
    var body: some View {
        VStack {
            Text("Address Book")
                .font(.title)
                .padding()
            Spacer()
            ContactsView()
            Spacer()
            if displayFavoriteCount {
                HStack {
                    Text("You have \(viewModel.favoritedContactCount) favorite" + (viewModel.favoritedContactCount != 1 ? "s" : ""))
                        .padding()
                    Spacer()
                }
            }
        }
        .background(Color(red: 254/255, green: 240/255, blue: 229/255).ignoresSafeArea())
    }
}

#Preview {
    AddressBookView()
}
