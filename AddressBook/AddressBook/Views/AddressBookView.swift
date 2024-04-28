//
//  ContentView.swift
//  AddressBook
//
//  Created by Ben Stone.
//  Code written and completed by Sean McDonald following iOS Development path on Codecademy.


import SwiftUI

struct AddressBookView: View {
    // TODO: STATEOBJECT - Add propery wrapper to viewModel so that it observes changes
    private var viewModel = AddressBookViewModel()
    
    // TODO: STATE - Add propery wrapper to displayFavoriteCount property so it can be reassigned
    private var displayFavoriteCount = true
    
    var body: some View {
        VStack {
            Text("Address Book")
                .font(.title)
                .padding()
            Spacer()
            ContactsView() // TODO: ENVIRONMENTOBJECT - Pass the viewModel to the ContactsView
            Spacer()
            if displayFavoriteCount {
                HStack {
                    Text("You have \(viewModel.favoritedContactCount) favorite" + (viewModel.favoritedContactCount != 1 ? "s" : ""))
                        .padding()
                    Spacer()
                }
            }
            // TODO: STATE - Add toggle for displayFavoriteCount
        }
        .background(Color(red: 254/255, green: 240/255, blue: 229/255).ignoresSafeArea())
    }
}

#Preview {
    AddressBookView()
}
