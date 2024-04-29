//
//  Contact.swift
//  AddressBook
//
//  Created by Ben Stone on 2/12/21.
//  Written by Sean McDonald following iOS Development path on Codecademy

import Foundation

struct Contact {
    let name: String
    let postalCode: Int
    var isFavorite = false
    
    var displayPostalCode: String {"Postal Code: \(String(postalCode))"}
}
