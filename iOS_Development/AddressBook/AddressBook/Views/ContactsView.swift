//
//  ContactsView.swift
//  AddressBook
//
//  Created by Ben Stone 3/3/21.
//  Code written and completed by Sean McDonald following iOS Development path on Codecademy
//

import SwiftUI

struct ContactsView: View {
    @EnvironmentObject var viewModel: AddressBookViewModel
    
    var body: some View {
        ForEach(0..<viewModel.contactCount) {index in
            HStack {
                let contact = viewModel.contact(atIndex: index)
                VStack {
                    Text(contact.name)
                    Text(contact.displayPostalCode)
                        .font(.caption2)
                }
                Button (action: {
                    viewModel.toggleFavorite(atIndex: index)
                }) {
                    contact.isFavorite ? Image(systemName: "star.fill") : Image(systemName: "star")
                }
            }
            .padding()
            .border(Color.black, width: 1)
        }
    }
}

#Preview {
    ContactsView()
        .environmentObject(AddressBookViewModel())
}
