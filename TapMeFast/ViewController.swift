//
//  ViewController.swift
//  TapMeFast
//
//  Created by Chayanne on 6/14/17.
//  Copyright © 2017 Chayanne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var timeLabel1: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var TapMeBtn: UIButton!
    @IBOutlet var StartGame: UIButton!
    
    
    var time = Timer()
    var timeInt = 0
    var tapInt = 0
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeInt = 10
        tapInt  = 0
        
        timeLabel1.text = String(timeInt)
        scoreLabel.text = String(tapInt)
        TapMeBtn.isEnabled  = false
        TapMeBtn.alpha = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapMe(_ sender: Any) {
        
        tapInt += 1
        scoreLabel.text = String(tapInt)
    }
    
    @IBAction func startGame(_ sender: Any) {
        if timeInt == 10{
        
            tapInt = 0
            scoreLabel.text = String(tapInt)
            
            TapMeBtn.isEnabled = true
            TapMeBtn.alpha = 1
            
            StartGame.isEnabled = false
            StartGame.alpha = 0.5
            
            //nstimer
            time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.startCount), userInfo: nil, repeats: true)

        }
        
        if timeInt == 0 {
        
            timeInt = 10
            tapInt = 0
            timeLabel1.text = String(timeInt)
            scoreLabel.text = String(tapInt)
            StartGame.setTitle("Start Game", for: [])
        }
    }
    func startCount(){
        
        timeInt = timeInt - 1
        timeLabel1.text = String(timeInt)
        
        if timeInt == 0 {
            
            time.invalidate()
            TapMeBtn.isEnabled = false
            TapMeBtn.alpha = 0.5
            
            StartGame.isEnabled = true
            StartGame.alpha = 1
            
            StartGame.setTitle("Restart", for: [])

        }
    }
}

