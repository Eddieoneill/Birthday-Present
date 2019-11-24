//
//  ViewController.swift
//  James's Birthday
//
//  Created by Edward O'Neill on 11/22/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import UIKit
import SafariServices


class ViewController: UIViewController {
    @IBOutlet var options: [UIButton]!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var question: UITextView!
    
    var scoreCounter = 0
    var questions = Questions.scramble()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        score.text = "Score: 0/3"
        getQuestion()
    }
    
    func getQuestion() {
        let question1 = questions.randomElement()
        var indexNum = 0
        question.text = question1?.key
        for option in question1?.value ?? [""] {
            options[indexNum].setTitle(option, for: .normal)
            indexNum += 1
        }
        questions.removeValue(forKey: question1?.key ?? "")
    }
    
    @IBAction func test(_ sender: UIButton) {
        if score.text == "Score: 3/3" {
            if let url = URL(string: "https://giphy.com/gifs/jonny-dog-happy-birthday-l2Sqc7i2y1FGUVpCM") {
                UIApplication.shared.open(url)
            }
        } else if options[0].titleLabel?.text == "Try Again..." {
            questions = Questions.scramble()
            score.text = "Score: 0/3"
            scoreCounter = 0
        }
        
        if Questions.correctAnswer.contains(sender.titleLabel?.text ?? "") {
            scoreCounter += 1
            score.text = "Score: \(scoreCounter)/3"
        }
        
        if !questions.isEmpty {
            getQuestion()
        } else if score.text == "Score: 3/3" {
            question.text = "Click Below for prize!!!"
            for button in options {
                button.setTitle("Click Here!!!", for: .normal)
            }
        } else {
            question.text = "You didn't quite make it click Below to try again for a perfect score!"
            for button in options {
                button.setTitle("Try Again...", for: .normal)
            }
        }
    }
}

