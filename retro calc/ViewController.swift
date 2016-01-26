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
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLbl: UILabel!
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftVarStr = ""
    var rightVarStr = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    

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
        //When the UI number is pressed on the calc, it drops it into this function
        //And we can call it with "btn"
        btnSound.play()
        
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }

    @IBAction func onDividePress(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPress(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }

    @IBAction func onSubtractPress(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPress(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPress(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    func processOperation(op: Operation) {
        playSound()
        
        //If it's the first time a math operator is pressed, we need to store it
        //Otherwise we need to 
        if currentOperation != Operation.Empty {
            //Run some math
            
            //A user selected an operator and then selected another, without a num in front
            if runningNumber != "" {
            
                rightVarStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftVarStr)! * Double(rightVarStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftVarStr)! / Double(rightVarStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftVarStr)! - Double(rightVarStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftVarStr)! + Double(rightVarStr)!)"
                }
                
                leftVarStr = result
                outputLbl.text = result
            }
            
            currentOperation = op
            
            
        } else {
            //First time an operator is being pressed 
            //User needs to be able to start typing the 2nd number 
            leftVarStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
        
    }
    
    //The below function is for playing sounds but also for cleanup.
    //If the sound is currently playing we don't want it to overlap.
    //Instead we want it to stop playing and start again when pressed.
    func playSound() {
        if btnSound.playing {
            btnSound.stop()
        }
        
        btnSound.play()
    }
    
}

