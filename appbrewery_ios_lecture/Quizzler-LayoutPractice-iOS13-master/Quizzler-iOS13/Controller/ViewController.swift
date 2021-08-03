//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userSelected = sender.currentTitle! // True, False
        let userGotItRight = quizBrain.checkAnswer(userSelected)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
    
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector:#selector(updateUI), userInfo:nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        button1.backgroundColor = UIColor.clear
        button2.backgroundColor = UIColor.clear
        button3.backgroundColor = UIColor.clear
        
        button1.setTitle(quizBrain.getButtonTitle(index: 0), for: .normal)
        button2.setTitle(quizBrain.getButtonTitle(index: 1), for: .normal)
        button3.setTitle(quizBrain.getButtonTitle(index: 2), for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score : \(quizBrain.getScore())"
        
    }
    
}

