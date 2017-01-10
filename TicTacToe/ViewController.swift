//
//  ViewController.swift
//  TicTacToe
//
//  Created by Shailendra Suriyal on 10/01/17.
//  Copyright © 2017 RealDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

// 1 for nought and 2 for cross
    var activePlayer = 1 ;

    //Save Game state
    var gameState = [0,0,0,0,0,0,0,0,0]
override func viewDidLoad() {
    super.viewDidLoad()
    print("Loaded ")
    // Do any additional setup after loading the view, typically from a nib.
}

@IBAction func buttonPressed(_ sender: UIButton) {
    print("button pressed \(sender.tag)")
    
    let activePosition = sender.tag - 1
    
    if gameState[activePosition] == 0 {
        
        if activePlayer == 1 {
            
            gameState[activePosition] = 1
            sender.setImage(UIImage(named: "nought.png"), for: []);
            activePlayer = 2;
            
        } else {
            
            gameState[activePosition] = 2
            sender.setImage(UIImage(named: "cross.png"), for: []);
            activePlayer = 1;
            
        }
    }
    
   
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


}

