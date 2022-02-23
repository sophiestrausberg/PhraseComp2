//
//  Question.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 2/23/22.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctAnswerIndex: Int
    
    //correct answer string?
    static let allQuestions = [
        Question(text: "How is your day?", answers: ["Good", "Bad", "Okay"], correctAnswerIndex: 0),
        Question(text: "Skating on thin...", answers: ["Ice", "Water", "Snow", "Pigs"], correctAnswerIndex: 0)
    ]
    
}
