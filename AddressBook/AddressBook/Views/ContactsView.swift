//
//  ContactsView.swift
//  AddressBook
//
//  Created by Ben Stone 3/3/21.
//  Code written and completed by Sean McDonald following iOS Development path on Codecademy
//

import SwiftUI

struct ContactsView: View {
    // TODO: ENVIRONMENTOBJECT - Add view model
    
    var body: some View {
        ForEach(0..<4) {index in // TODO: ENVIRONMENTOBJECT - Use the number of contacts from the view model
            HStack {
                VStack {
                    // TODO: ENVIRONMENTOBJECT - Add the correct name and postal code
                    Text("Name at index \(index)")
                    Text("Postal code")
                        .font(.caption2)
                }
                Button (action: {
                    // TODO: ENVIRONMENTOBJECT - Call the appropriate view model method
                    print("Star tapped at index: \(index)")
                }) {
                    // TODO: ENVIRONMENTOBJECT - Update the star to be filled when the contact is a favorite
                    Image(systemName: "star")
                }
            }
            .padding()
            .border(Color.black, width: 1)
        }
    }
}

#Preview {
    ContactsView() // TODO: ENVIRONMENTOBJECT - Add the view model to the preview
}
