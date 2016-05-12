//
//  ViewController.swift
//  Quiz
//
//  Created by Derek Gilwa on 5/5/16.
//  Copyright © 2016 gliwaderek.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    let questions: [String] = ["From what is cognac made?", "What is 7 + 7?", "What is the capital of Vermont"]
    
    let answers: [String] = ["Grapes", "14", "Montpelier"]
    
    var currentQuestionIndex = 0
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        nextQuestionLabel.alpha = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
        updateOffscreenLabel()
    }
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex = (currentQuestionIndex + 1) % questions.count
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    func updateOffscreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
    
    func animateLabelTransitions() {
        view.layoutIfNeeded()

        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = 0
        currentQuestionLabelCenterXConstraint.constant += screenWidth
        UIView.animateWithDuration(0.5,
            delay: 0,
            options: [],
            animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
            self.view.layoutIfNeeded()
            }, completion: { _ in
                swap(&self.currentQuestionLabel,
                &self.nextQuestionLabel)
                swap(&self.nextQuestionLabelCenterXConstraint,
                &self.currentQuestionLabelCenterXConstraint)
                
                self.updateOffscreenLabel()
        })
    }
}

