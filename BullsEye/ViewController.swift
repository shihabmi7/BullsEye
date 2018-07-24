//
//  ViewController.swift
//  BullsEye
//
//  Created by Mahmud Riad on 7/5/18.
//  Copyright © 2018 Shihab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    @IBOutlet weak var slider: UISlider!;
    var targetvaue : Int = 0
    @IBOutlet weak var targetValueLabel: UILabel!;
    
    var score = 0
    var roundNumber = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
        startOver()
    }
    func startNewRound(){
        targetvaue =  1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        roundNumber += 1
        updateLabel()
    }
    
    func updateLabel() {
        targetValueLabel.text = String(targetvaue)
        scoreLabel.text = String(score)
        roundLabel.text = String (roundNumber)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func sliderMoved(_ slider: UISlider){
        
        print("The value of slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert(){
        let differece: Int = abs( currentValue - targetvaue );
        
        let point = 100 - differece

        score = score + point
        
        let title :String
        
        if differece == 0 {
            title = "Perfect!"
        }else if differece < 10 {
            title = "You almost there!"
        }else {
            title = "Very Bad!!!"
        }
            
        
        let message = "The value of slide is \(currentValue)" + "\n The target value is \(targetvaue)" + "\n The difference is: \(differece)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        //startNewRound()
        
    }
    
    
    @IBAction func startOver(){
        score = 0;
        roundNumber = 0
        startNewRound()
    }
    
    

}

