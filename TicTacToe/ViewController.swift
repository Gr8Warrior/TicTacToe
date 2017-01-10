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
    
    //Winning Combinations
    let winninngCombinations = [[0,1,2,],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
    
override func viewDidLoad() {
    super.viewDidLoad()
    print("Loaded ")
    // Do any additional setup after loading the view, typically from a nib.
}

@IBAction func buttonPressed(_ sender: UIButton) {
    print("button pressed \(sender.tag)")
    
    let activePosition = sender.tag - 1
    
    //If the position is not already occupied
    if gameState[activePosition] == 0 {
        
        gameState[activePosition] = activePlayer
        
        
        
        if activePlayer == 1 {
            sender.setImage(UIImage(named: "nought.png"), for: []);
            activePlayer = 2;
        } else {
            sender.setImage(UIImage(named: "cross.png"), for: []);
            activePlayer = 1;
        }
        
        for combinations in winninngCombinations {
            
            if gameState[combinations[0]] != 0 {
                if (gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]]){
                    
                    print("Game Over. Winner is \(gameState[activePosition]) ")
                }
            }
        }
        
    }
    
   
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


}

