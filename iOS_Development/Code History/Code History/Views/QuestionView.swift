//
//  QuestionView.swift
//  Code History
//
//  Created by Sean McDonald on 4/29/24.
//

import SwiftUI

struct QuestionView: View {
  @EnvironmentObject var viewModel: GameViewModel
  let question: Question

  var body: some View {
    VStack {
      Text(question.questionText)
        .font(.largeTitle)
        .bold()
        .multilineTextAlignment(.leading)
      Spacer()
      HStack {
        ForEach(0..<question.possibleAnswers.count) { answerIndex in
          Button {
            print("Tapped on option with the text: \(question.possibleAnswers[answerIndex])")
            viewModel.makeGuess(atIndex: answerIndex)
          } label: {
            ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
              .background(viewModel.color(forOptionIndex: answerIndex))
          }
          .disabled(viewModel.guessWasMade)
        }
      }
      if viewModel.guessWasMade {
        Button(action: { viewModel.displayNextScreen() }) {
          BottomTextView(str: "Next")
        }
      }
    }
  }
}

#Preview {
  QuestionView(question: Game().currentQuestion)
    .environmentObject(GameViewModel())
}
