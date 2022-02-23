//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Sophie Strausberg on 6/19/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

//QUESTION LOGIC
import Foundation

struct Question {
    let question: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.question = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
    
