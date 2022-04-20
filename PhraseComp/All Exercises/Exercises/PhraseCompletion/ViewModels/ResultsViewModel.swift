//
//  ResultsViewModel.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 2/23/22.
//

import Foundation

struct ResultsViewModel {
    let isCorrect: (correct: Int, incorrect: Int)
    
    var scoreText: String {
        "Score: \(isCorrect.correct) / \(isCorrect.incorrect + isCorrect.correct)"
    }
    
    var correctText: String {
        "Correct: \(isCorrect.correct)"
    }
    
    var incorrectText: String {
        "Incorrect: \(isCorrect.incorrect)"
    }
}
