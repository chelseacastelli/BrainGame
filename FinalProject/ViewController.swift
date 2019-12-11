//
//  ViewController.swift
//  FinalProject
//
//  Created by ChelseaAnne Castelli on 12/10/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let possibleColors = ["blue", "red", "green", "orange", "yellow"]
    let possibleUIColors = [UIColor.blue, UIColor.red, UIColor.green, UIColor.orange, UIColor.yellow]
    
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var textColorLabel: UILabel!
    @IBOutlet weak var answerIndicator: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    
    var gameTimer = Timer()
    
    var time: Int = 9 {
        didSet {
            timeLabel.text = String(time)
        }
    }
    
    var score: Int = 0 {
        didSet {
            scoreLabel.text = String(score)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        generateMeaning()
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.startGameTimer), userInfo: nil, repeats: true)
    }
     
    @IBAction func noTapped(_ sender: Any) {
        if possibleColors.firstIndex(of: meaningLabel.text!) != possibleUIColors.firstIndex(of: textColorLabel.textColor) {
            answerIndicator.text = "Correct!"
            answerIndicator.textColor = UIColor.green
            score += 10
        } else {
            answerIndicator.text = "Wrong!"
            answerIndicator.textColor = UIColor.red
            score -= 10
        }
        answerIndicator.isHidden = false
    }
      
    @IBAction func yesTapped(_ sender: Any) {
        if possibleColors.firstIndex(of: meaningLabel.text!) == possibleUIColors.firstIndex(of: textColorLabel.textColor) {
            answerIndicator.text = "Correct!"
            answerIndicator.textColor = UIColor.green
            score += 10
        } else {
            answerIndicator.text = "Wrong!"
            answerIndicator.textColor = UIColor.red
            score -= 10
        }
        answerIndicator.isHidden = false
    }
      
    func generateMeaning() {
        answerIndicator.isHidden = true
        
        let randomMeaning = Int.random(in: 0..<possibleColors.count)
        let randomTextColor = Int.random(in: 0..<possibleColors.count)
        let randomColor = Int.random(in: 0..<possibleUIColors.count)
          
        meaningLabel.text = possibleColors[randomMeaning]
        textColorLabel.text = possibleColors[randomTextColor]
        textColorLabel.textColor = possibleUIColors[randomColor]
    }
    
    @objc func startGameTimer() {
        time -= 1
        timeLabel.text = String(time)
        
        if time == 0 {
            gameTimer.invalidate()
            headerLabel.isHidden = true
            answerIndicator.text = "Times up!  Your score: \(score)"
            answerIndicator.textColor = UIColor.white
            answerIndicator.isHidden = false
        }
    }

}

