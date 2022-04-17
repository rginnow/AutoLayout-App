//
//  ViewController.swift
//  AutoLayout-iOS13
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImage1: UIImageView!
    @IBOutlet weak var diceImage2: UIImageView!
    @IBOutlet weak var diceImage3: UIImageView!
    @IBOutlet weak var tripleLabel: UILabel!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var doubleButton: UIButton!
    @IBOutlet weak var mathButton: UIButton!
    
    let imageCollection = [
        UIImage(named: "DiceOne"),
        UIImage(named: "DiceTwo"),
        UIImage(named: "DiceThree"),
        UIImage(named: "DiceFour"),
        UIImage(named: "DiceFive"),
        UIImage(named: "DiceSix"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        diceImage3.isHidden = true;
        tripleLabel.isHidden = true;
        
        diceImage1.image = imageCollection.randomElement()!!
        diceImage2.image = imageCollection.randomElement()!!
        
        if(diceImage1.image == diceImage2.image) {
            diceImage3.isHidden = false;
            diceImage3.image = imageCollection.randomElement()!!
            
            if(diceImage3.image == diceImage2.image) {
                tripleLabel.isHidden = false;
            }
        }
    }
    
    @IBAction func doubleButtonPressed(_ sender: UIButton) {
        diceImage3.isHidden = true;
        tripleLabel.isHidden = true;
        
        let rand = Int.random(in: 0...5);
        
        diceImage1.image = imageCollection[rand]
        diceImage2.image = imageCollection[rand]
    }
    
    @IBAction func mathButtonPressed(_ sender: UIButton) {
        diceImage3.isHidden = true;
        tripleLabel.isHidden = true;
        
        let rand1 = Int.random(in: 2...10)
        let rand2 = Int.random(in: 3...15)
        
        let diceVal1 = Int(round(Double(rand1 / 2)))
        let diceVal2 = Int(round(Double(rand2 / 3)))
        
        diceImage1.image = imageCollection[diceVal1]
        diceImage2.image = imageCollection[diceVal2]
        
        if(diceImage1.image == diceImage2.image) {
            diceImage3.isHidden = false;
            diceImage3.image = imageCollection[Int.random(in: 0...5)]
            
            if(diceImage3.image == diceImage2.image) {
                tripleLabel.isHidden = false;
            }
        }
    }
}

