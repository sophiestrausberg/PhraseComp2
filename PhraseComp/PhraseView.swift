//
//  PhraseView.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 2/23/22.
//

import SwiftUI

struct PhraseView: View {
    var body: some View {
        VStack {
            
            Text("score").font(.system(size: 17))
            Spacer()
            Text("Question Text").font(.system(size: 30)).bold()
            Spacer()
                
            VStack {
                Button("answerText") {
                    print("Working")
                }
                .background(Image("Rectangle"))
                .padding(.bottom, 50.0)
                
                Button("answerText") {
                    print("Working")
                }
                .background(Image("Rectangle"))
                .padding(.bottom, 50.0)
                
                Button("answerText") {
                    print("Working")
                }
                .background(Image("Rectangle"))
                .padding(.bottom, 50.0)
            }
            
            ProgressView(value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/).padding(.horizontal, 100.0)
            
        }
        .padding(.vertical, 80.0)
        .frame(width: .infinity, height: .infinity)
            .edgesIgnoringSafeArea(.all)
        //DARK MODE
            .background(Color("BackgroundBlue"))
            .foregroundColor(Color.white)
        }
}

struct PhraseView_Previews: PreviewProvider {
    static var previews: some View {
        PhraseView()
    }
}
