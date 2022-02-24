//
//  PhraseView.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 2/23/22.
//

import SwiftUI

struct PhraseView: View {
    @StateObject var PhraseVM = PhraseViewModel()
    @State var CheckClicked = false
    @State var selectedIndex: Int? = nil
    //do in viewmodel
    @State var progress = 0.0
    //should probably be in view model but i dont care
    @State var isCorrect = (correct: 0, incorrect: 0)
    @State var gameOver = false
    
    var body: some View {
        VStack {
            
            ProgressView(value: progress).padding(.horizontal, 100.0)
            Spacer()
            Text(PhraseVM.questionText).bold().multilineTextAlignment(.center).font(.system(size: 30))
            Spacer()
                
            VStack {
                //even though we change the index value (and PhraseVM.questionAnswersIndices updates), its still using the old one.
                //ITS ONLY CALCULATING THE VALUE IN THIS FOR LOOP ONCE
                //ITS NOT RECACULATING THE FOR EACH LOOP REGARLESS OF STATE
                ForEach(PhraseVM.questionAnswersIndices) { index in

                    AnswerButton(text: PhraseVM.questionAnswers[index]) {
                        selectedIndex = index
                    }
                    .background(colorForButton(at: index))
                    .cornerRadius(15)
                    .disabled(CheckClicked == true)
                }
               
            }
            
            if CheckClicked == false {
                FowardButton(text: "Check") {
                    //what if they haven't selected anything?
                    if let _ = selectedIndex {
                        if PhraseVM.questionAnswers[selectedIndex!] == PhraseVM.questionCorrectAnswer {
                            isCorrect.correct += 1
                        } else {
                            isCorrect.incorrect += 1
                        }
                        
                        selectedIndex! += 0
                        CheckClicked.toggle()
                    }
                }
            } else {
                FowardButton(text: "Next") {
                    
                    guard PhraseVM.fullExcersise.currentQuestionIndex + 1 < Question.allQuestions.count else {
                        print("GAME OVER")
                        CheckClicked.toggle()
                        gameOver = true
                        return
                    }
                    
                    print(PhraseVM.questionAnswersIndices)
                    PhraseVM.fullExcersise.advanceGameState()
                    //WHY ISNT IT CALLING THE UPDATES VERSION IN THE FOR EACH LOOP
                    print(PhraseVM.questionAnswersIndices)
                        
                    progress = Double(Double(PhraseVM.fullExcersise.currentQuestionIndex) / Double(Question.allQuestions.count))
                        
                    selectedIndex = nil
                    CheckClicked.toggle()
                    
                }
            }
            
            
        }
        
        .padding(.vertical, 60.0)
        .frame(width: .infinity, height: .infinity)
            .edgesIgnoringSafeArea(.all)
            .foregroundColor(Color("TextColor"))
            .background(Color("BackgroundBlue"))
            .navigationBarHidden(true)
            .background(resultsNavigationLink)
    }
    
    private var resultsNavigationLink : some View {
        NavigationLink(destination: ResultView(ResultsVM: ResultsViewModel(isCorrect: isCorrect)), isActive: .constant(gameOver), label: {
            EmptyView()
        })
        
    }
    
    func colorForButton(at index: Int) -> Color? {
        
        if CheckClicked == true {
            
            if PhraseVM.questionAnswers[index] == PhraseVM.questionCorrectAnswer {
                return .green
            }
            
            if index == selectedIndex {
                return .red
            }
            
        }
        
        guard index == selectedIndex else {
            return .clear
        }
        
        return .purple

    }
}

struct AnswerButton: View {
    let text: String
    let onClick: () -> Void
    var body: some View {
        
        Button(action: {
                onClick()
            }) {
                Text(text)
                    .frame(width: 320, height: 50, alignment: .center)
                    .padding()
                    .foregroundColor(Color("ButtonTextColor"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("ButtonOutline"), lineWidth: 15)
                )
            }
        }
}

struct PhraseView_Previews: PreviewProvider {
    static var previews: some View {
        PhraseView()
            .preferredColorScheme(.light)
    }
}
