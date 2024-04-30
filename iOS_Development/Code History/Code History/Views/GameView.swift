//
//  ContentView.swift
//  Code History
//
//  Created by Sean McDonald on 4/10/24.
//

import SwiftUI

struct GameView: View {
    
  @StateObject var viewModel = GameViewModel()
    
  var body: some View {
    ZStack {
      GameColor.main.ignoresSafeArea()
      VStack {
        Text(viewModel.questionProgressText)
          .font(.callout)
          .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
          .padding()
        QuestionView(question: viewModel.currentQuestion)
      }
    }
    .foregroundColor(.white)
    .navigationBarHidden(true)
    .environmentObject(viewModel)
  }
}

#Preview {
  GameView()
}
