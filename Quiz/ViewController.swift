//
//  ViewController.swift
//  Quiz
//
//  Created by Derek Gilwa on 5/5/16.
//  Copyright © 2016 gliwaderek.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["From what is cognac made?", "What is 7 + 7?", "What is the capital of Vermont"]
    
    let answers: [String] = ["Grapes", "14", "Montpelier"]
    
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex = (currentQuestionIndex + 1) % questions.count
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
}

