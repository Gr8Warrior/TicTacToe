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

override func viewDidLoad() {
    super.viewDidLoad()
    print("Loaded ")
    // Do any additional setup after loading the view, typically from a nib.
}

@IBAction func buttonPressed(_ sender: UIButton) {
    print("button pressed \(sender.tag)")
    
    if activePlayer == 1{
            sender.setImage(UIImage(named: "nought.png"), for: []);
         activePlayer = 2;
    } else {
        sender.setImage(UIImage(named: "cross.png"), for: []);
        activePlayer = 1;
    }
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


}

