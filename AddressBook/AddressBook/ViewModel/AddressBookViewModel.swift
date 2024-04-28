//
//  AddressBookViewModel.swift
//  AddressBook
//
//  Created by Ben Stone on 2/12/21.
//  Code written and completed by Sean McDonald following iOS Development path on Codecademy

import Foundation

class AddressBookViewModel: ObservableObject {
    var addressBook = AddressBook() // TODO: PUBLISHED - Add a property wrapper so that changes will be published
    
    var contactCount: Int { addressBook.numberOfContacts }
    
    var favoritedContactCount: Int { addressBook.numberOfFavorites }
    
    func toggleFavorite(atIndex index: Int) {
        addressBook.toggleFavorite(atIndex: index)
    }
    
    func contact(atIndex index: Int) -> Contact {
        addressBook.contact(atIndex: index)
    }
}
