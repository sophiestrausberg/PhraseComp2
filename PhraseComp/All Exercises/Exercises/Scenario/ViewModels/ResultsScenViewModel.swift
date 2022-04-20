//
//  ResultsScenViewModel.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 4/19/22.
//

import Foundation

struct ResultsScenViewModel {
    let wordsUsed: Int
    let scenarios : Int
    
    var wordsPracticedText: String {
        "You practiced \(wordsUsed) words!"
    }
    
    var scenariosText: String {
        "You completed \(scenarios) scenarios!"
    }
}
