//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Sean McDonald on 5/14/24.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
