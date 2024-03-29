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
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    
    @IBOutlet weak var playAgainYesButton: UIButton!
    @IBOutlet weak var playAgainNoButton: UIButton!
    
    // Timer variables
    var gameTimer = Timer()
    var time: Int = 60 {
        didSet {
            timeLabel.text = String(time)
        }
    }
    
    var score: Int = 0 {
        didSet {
            scoreLabel.text = String(score)
        }
    }
    
    var correctGuesses: Int = 0
    var incorrectGuesses: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startScreen()
        generateLabels()
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.startGameTimer), userInfo: nil, repeats: true)
    }
     
    // If no was tapped, checks to make sure answer was wrong
    @IBAction func noTapped(_ sender: Any) {
        if possibleColors.firstIndex(of: meaningLabel.text!) != possibleUIColors.firstIndex(of: textColorLabel.textColor) {
            answerIndicator.text = "Correct!"
            answerIndicator.textColor = UIColor.green
            score += 10
            correctGuesses += 1
        } else {
            answerIndicator.text = "Wrong!"
            answerIndicator.textColor = UIColor.red
            score -= 10
            incorrectGuesses += 1
        }
        answerIndicator.isHidden = false
        
        // Takes .5 seconds to call generateLabels() so that correct/incorrect indicator has time to display
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Change `2.0` to the desired number of seconds.
            self.generateLabels()
        }
    }
      
    // If yes was tapped, checks to make sure answer was correct
    @IBAction func yesTapped(_ sender: Any) {
        if possibleColors.firstIndex(of: meaningLabel.text!) == possibleUIColors.firstIndex(of: textColorLabel.textColor) {
            answerIndicator.text = "Correct!"
            answerIndicator.textColor = UIColor.green
            correctGuesses += 1
            score += 10
        } else {
            answerIndicator.text = "Wrong!"
            answerIndicator.textColor = UIColor.red
            score -= 10
            incorrectGuesses += 1
        }
        answerIndicator.isHidden = false
        
        // Takes .5 seconds to call generateLabels() so that correct/incorrect indicator has time to display
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Change `2.0` to the desired number of seconds.
            self.generateLabels()
        }
    }
    
    // Get random values for each label
    func generateLabels() {
        
        // Hide answer indicator between guesses
        answerIndicator.isHidden = true
        
        let randomMeaning = Int.random(in: 0..<possibleColors.count)
        let randomTextColor = Int.random(in: 0..<possibleColors.count)
        let randomColor = Int.random(in: 0..<possibleUIColors.count)
          
        meaningLabel.text = possibleColors[randomMeaning]
        textColorLabel.text = possibleColors[randomTextColor]
        textColorLabel.textColor = possibleUIColors[randomColor]
    }
    
    // Count timer down by 1
    // If timer reaches 0, display times up screen with options to play again or quit along w/ score info
    @objc func startGameTimer() {
        time -= 1
        timeLabel.text = String(time)
        
        if time == 0 {
            timesUpScreen()
        }
    }
    
    // If player wants to play again, go back to start screen & reset timer
    @IBAction func playAgain(_ sender: Any) {
        startScreen()
        generateLabels()
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.startGameTimer), userInfo: nil, repeats: true)
    }
    
    // If user doesn't want to play again, exit app
    @IBAction func dontPlayAgain(_ sender: Any) {
        exit(0)
    }
    
    func startScreen() {
        noButton.isEnabled = true
        yesButton.isEnabled = true
        playAgainNoButton.isHidden = true
        playAgainYesButton.isHidden = true
        answerIndicator.isHidden = true
        titleLabel.text = "Does the top word match the color of the bottom word?"
        headerLabel.isHidden = false
        meaningLabel.isHidden = false
        textColorLabel.isHidden = false
        time = 60
        score = 0
        correctGuesses = 0
        incorrectGuesses = 0
    }
    
    func timesUpScreen() {
        noButton.isEnabled = false
        yesButton.isEnabled = false
        gameTimer.invalidate()
        headerLabel.isHidden = true
        meaningLabel.isHidden = true
        textColorLabel.isHidden = true
        titleLabel.text = "Do you want to play again?"
        playAgainYesButton.isHidden = false
        playAgainNoButton.isHidden = false
        answerIndicator.text = "Times up!  Your score: \(score)\nYou got \(correctGuesses) out of \(correctGuesses + incorrectGuesses)"
        answerIndicator.textColor = UIColor.white
        answerIndicator.isHidden = false
    }
}

