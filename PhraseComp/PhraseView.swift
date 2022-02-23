//
//  PhraseView.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 2/23/22.
//

import SwiftUI

struct PhraseView: View {
    let question: Question
    @State var selectedIndex: Int? = nil
    
    var body: some View {
        VStack {
            
            ProgressView(value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/).padding(.horizontal, 100.0)
            Spacer()
            Text(question.text).bold().multilineTextAlignment(.center).font(.system(size: 30))
            Spacer()
                
            VStack {
                ForEach(question.answers.indices) { index in
                    AnswerButton(text: question.answers[index]) {
                        selectedIndex = index
                    }
                    .background(colorForButton(at: index))
                    .cornerRadius(15)
                }
               
            }
            
            Button(action: {
                  
                }) {
                    Text("Next")
                        .frame(width: 320, height: 20, alignment: .center)
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("ButtonOutline"), lineWidth: 15)
                    )
                    //darker
                        .background(Color("ButtonOutline"))
                        .cornerRadius(15)
                }
            
            
        }
        
        .padding(.vertical, 60.0)
        .frame(width: .infinity, height: .infinity)
            .edgesIgnoringSafeArea(.all)
            .foregroundColor(Color("TextColor"))
            .background(Color("BackgroundBlue"))
        }
    
    func colorForButton(at index: Int) -> Color {
        guard index == selectedIndex else {
            return .clear
        }
        
        return .green

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
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("ButtonOutline"), lineWidth: 15)
                )
            }
        }
}

struct PhraseView_Previews: PreviewProvider {
    static var previews: some View {
        PhraseView(question: Question.allQuestions[0])
            .preferredColorScheme(.dark)
    }
}
