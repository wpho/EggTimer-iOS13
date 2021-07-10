//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        let hardness = sender.currentTitle!
        doneLabel.text = hardness
        startTimer(eggTime: eggTimes[hardness]!)
        
    }
    
    func startTimer(eggTime: Int) {
        var secondsRemaining = eggTime
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if secondsRemaining > 0 {
                    print ("\(secondsRemaining) seconds")
                    let percentage = Float(secondsRemaining) / Float (eggTime)
                    print(percentage)
                    self.progressBar.progress = 1.0 - percentage
                    secondsRemaining -= 1
                } else {
                    Timer.invalidate()
                    self.progressBar.progress = 1.0
                    self.doneLabel.text = "DONE!"
                }
            }
    }
    

}
