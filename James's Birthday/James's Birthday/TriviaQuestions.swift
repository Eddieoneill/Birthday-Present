//
//  TriviaQuestions.swift
//  James's Birthday
//
//  Created by Edward O'Neill on 11/22/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import Foundation

struct Questions {
    
    static let correctAnswer: Set<String> = ["Elan Musk", "30", "9/10", "Pacque", "3/16", "Swift"]
    static let questionList: [String: [String]] = [
        "Who invented Tesla?": ["Elan Musk", "Nicola Tesla", "Bill Gates"],
        "How old is Derek?": ["29", "30", "31"],
        "When was your first day at Chexology?": ["9/10", "9/12", "9/8"],
        "What is Lisa's current last name?": ["Pacque", "Packque", "O'Neill"],
        "What is Mom's birthday?": ["3/16", "3/14", "3/15"],
        "What is the computer language eddie is currently learning?": ["Swift", "Python", "JavaScript"]
    ]
    
    static func scramble() -> [String: [String]] {
        var randomQuestions = self.questionList
        
        for _ in 0..<3 {
            randomQuestions.removeValue(forKey: randomQuestions.randomElement()?.key ?? "")
        }
        
        return randomQuestions
    }
}
