//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()

     
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadQuestion()
    }
    

    @IBAction func onAnswerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
    
        quizBrain.increaseProgress()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(reloadQuestion), userInfo: nil, repeats: false)
    }

    
    @objc func reloadQuestion() {
        // Do any additional setup after loading the view.
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        progressBar.progress = quizBrain.currentProgress()
        scoreLabel.text = "Score : \(quizBrain.getScore())"
        questionLabel.text = quizBrain.currentQuestion()
    }
    
}

