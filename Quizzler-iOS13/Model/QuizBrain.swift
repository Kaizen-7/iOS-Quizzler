//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Luca Rinzivillo on 05/11/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    let quiz = [
        Question(text: "4+4 = 8", answer: "True"),
        Question(text: "8+8 = 8", answer: "False"),
        Question(text: "2+2 = 4", answer: "True"),
    ]
    var questionNumber = 0
    var score = 0
    
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func currentQuestion() -> String {
        return quiz[questionNumber].text
    }
    
    func currentProgress() -> Float {
        return Float(questionNumber+1) / Float(quiz.count)
    }
    
    mutating func increaseProgress() {
        if (questionNumber < quiz.count - 1) {
            questionNumber += 1
        } else {
            score = 0
            questionNumber = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
}
