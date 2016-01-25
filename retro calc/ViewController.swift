//
//  ViewController.swift
//  retro calc
//
//  Created by Amaya on 1/21/16.
//  Copyright © 2016 Amaya. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Equals = "="
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLbl: UILabel!
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftVarStr = ""
    var rightVarStr = ""
    var currentOperation: Operation = Operation.Empty
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberPressed(btn: UIButton!) {
        btnSound.play()
    }

    @IBAction func onDividePress(sender: AnyObject) {
    }
    
    @IBAction func onMultiplyPress(sender: AnyObject) {
    }

    @IBAction func onSubtractPress(sender: AnyObject) {
    }
    
    @IBAction func onAddPress(sender: AnyObject) {
    }
    
    @IBAction func onEqualPress(sender: AnyObject) {
    }
    
}

