//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Sean McDonald on 5/15/24.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    private var recipeData = RecipeData()
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: [GridItem()], content: {
                ForEach(MainInformation.Category.allCases,
                        id: \.self) { category in
                    Text(category.rawValue)
                        .font(.title)
                }
            })
            .navigationTitle("Categories")
        }
    }
}

#Preview {
    RecipeCategoryGridView()
}
