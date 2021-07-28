//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft" : 3, "Medium": 4, "Hard": 7]
//    var dict : [String : Int] = ["Angela": 1234, "Philipp": 5678]
    var timer = Timer()
    var player: AVAudioPlayer?
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
        
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        let hardness = sender.currentTitle!
        let total = eggTimes[hardness]!
        var secondsPassed = 0
        doneLabel.text = hardness
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsPassed < total {
                secondsPassed += 1
                self.progressBar.setProgress(Float(secondsPassed)/Float(total), animated: true)
            } else {
                Timer.invalidate()
                self.doneLabel.text = "DONE!"
                self.playSound()
            }
        }

    }
    

}
