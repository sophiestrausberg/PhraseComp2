//
//  ContentView.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 2/23/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PhraseView(question: Question.allQuestions[0])
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhraseView(question: Question.allQuestions[0])
            .preferredColorScheme(.dark)
    }
}
