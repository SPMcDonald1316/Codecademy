//
//  Recipe.swift
//  Cookcademy
//
//  Created by Sean McDonald on 5/13/24.
//

import Foundation

struct Recipe {
  var mainInformation: MainInformation
  var ingredients: [Ingredient]
  var directions: [Direction]
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

struct Ingredient {
  var name: String
  var quantity: Double
  var unit: String // Ounces, Grams, Cups etc...
}

struct Direction {
  var description: String
  var isOptional: Bool"
}

