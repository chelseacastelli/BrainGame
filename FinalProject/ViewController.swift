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
    let possibleUIColors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow, UIColor.orange]
    
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var textColorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        generateMeaning()
    }
    
    @IBAction func noTapped(_ sender: Any) {
        
    }
    
    @IBAction func yesTapped(_ sender: Any) {
        
    }
    
    func generateMeaning() {
        let randomMeaning = Int.random(in: 0..<possibleColors.count)
        let randomTextColor = Int.random(in: 0..<possibleColors.count)
        let randomColor = Int.random(in: 0..<possibleUIColors.count)
        
        meaningLabel.text = possibleColors[randomMeaning]
        textColorLabel.text = possibleColors[randomTextColor]
        textColorLabel.textColor = possibleUIColors[randomColor]
    }
    
//    func generateRandomColor() -> UIColor {
//      let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
//      let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
//      let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
//
//       return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
//    }

}

