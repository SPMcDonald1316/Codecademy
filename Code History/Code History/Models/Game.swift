//
//  Game.swift
//  Code History
//
//  Created by Sean McDonald on 4/25/24.
//

import Foundation

struct Game {
    private(set) var currentQuestionIndex = 0
    private(set) var guesses = [Question: Int]()
    private let questions = Question.allQuestions.shuffled()
    
    mutating func makeGuessForCurrentQuestion(atIndex index: Int) {
        guesses[currentQuestion] = index
    }
}
