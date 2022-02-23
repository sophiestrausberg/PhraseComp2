//
//  PhraseController.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 2/23/22.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()

    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    var quizBrain = QuizBrain()
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        progressBar.progress = 0.1
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
//        let actualAnswer = quiz[questionNumber].answer
        let check = quizBrain.checkAnswer(userAnswer)
        
        if check == true{
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.getQuestionNumber()
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        let answers = quizBrain.getAnswers()
        trueButton.setTitle(answers[0], for: .normal)
        falseButton.setTitle(answers[1], for: .normal)
        choice3.setTitle(answers[2], for: .normal)
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    }
}
