//
//  Recipe.swift
//  Cookcademy
//
//  Created by Sean McDonald on 5/13/24.
//

import Foundation

struct Recipe {
  var mainInformation: MainInformation
  var ingredients: [String]
  var directions: [String]
}

struct MainInformation {
  var name: String
  var description: String
  var author: String
  var category: Category
  
  enum Category: String, CaseIterable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case dessert = "Dessert"
  }
}

