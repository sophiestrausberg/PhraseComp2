//
//  FullExcersise.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 2/23/22.
//

import Foundation
struct FullExcersise {
    private let questions = Question.allQuestions.shuffled()
    //can still change variable locally, but only read outside
    private(set) var currentQuestionIndex = 0
    
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    mutating func advanceGameState() {
        currentQuestionIndex += 1
        //WHY ISNT THE CURRENT QUESTION UPDATING
//        currentQuestion = questions[currentQuestionIndex]
    }
}
