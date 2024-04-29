//
//  GameViewModel.swift
//  Code History
//
//  Created by Sean McDonald on 4/29/24.
//

import SwiftUI

class GameViewModel: ObservableObject {
    
  @Published private var game = Game()
    
  var currentQuestion: Question {
    game.currentQuestion
  }
    
  var questionProgressText: String {
    "\(game.currentQuestionIndex + 1) / \(game.numberOfQuestions)"
  }
}
