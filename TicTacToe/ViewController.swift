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

        // Active Game
        var activeGame = true;
        
        //Save Game state
        var gameState = [0,0,0,0,0,0,0,0,0]
        
        //Winning Combinations
        let winninngCombinations = [[0,1,2,],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded ")
        
        isHidden(state: true);
        winnerLabel.center = CGPoint(x: winnerLabel.center.x-500, y: winnerLabel.center.y)
        playAgain.center = CGPoint(x: playAgain.center.x-500, y: playAgain.center.y)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

        func isHidden(state :Bool){
                winnerLabel.isHidden = state
                playAgain.isHidden = state;
        }
        
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("button pressed \(sender.tag)")
        
        let activePosition = sender.tag - 1
        
        //If the position is not already occupied
        if gameState[activePosition] == 0 && activeGame{
            
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
                        activeGame = false;
                        setTextToWinnerLabel(player: gameState[activePosition]);
                        isHidden(state: false)
                        UIView.animate(withDuration: 1, animations: {
                            self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x+500, y: self.winnerLabel.center.y)
                            self.playAgain.center = CGPoint(x: self.playAgain.center.x+500, y: self.playAgain.center.y)
                            
                        })
                    }
                }
            }
            
        }
        
       
    }
        func setTextToWinnerLabel(player : Int ){
            if player == 1 {
                winnerLabel.text = "Nought is the winner"
            } else {
                winnerLabel.text = "Cross is the winner"
            }
        }

        @IBOutlet var winnerLabel: UILabel!
        
        @IBOutlet var playAgain: UIButton!
        
        @IBAction func playAgainAction(_ sender: Any) {
            activeGame = true;
            
            activePlayer = 1;
            gameState = [0,0,0,0,0,0,0,0,0]
            
            for i in 1..<10 {
                if let button = view.viewWithTag(i) as? UIButton {
                    
                    button.setImage(nil, for: [])
                    
                }
            }
            isHidden(state: true)
            winnerLabel.center = CGPoint(x: winnerLabel.center.x-500, y: winnerLabel.center.y)
            playAgain.center = CGPoint(x: playAgain.center.x-500, y: playAgain.center.y)
            
        }
        
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    }

