//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by דניאל בן אבי on 30/05/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var reset: [UIButton]!
    
    var currentPlayer = "X"
    var board = [String](repeating: "", count: 9)
    var gameActive = true
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }
    
    func resetGame() {
        board = [String](repeating: "", count: 9)
        gameActive = true
        currentPlayer = "X"
        statusLabel.text = "Player \(currentPlayer)'s Turn"
        for button in buttons {
            button.setTitle("", for: .normal)
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton){
        let index = buttons.firstIndex(of: sender)!
        print("index \(index)")
        
        if board[index] == "" && gameActive {
            board[index] = currentPlayer
            sender.setTitle(currentPlayer, for: .normal)
            
            if checkForWin() {
                statusLabel.text = "Player \(currentPlayer) Wins!"
                gameActive = false
            } else if board.contains("") == false {
                statusLabel.text = "It's a Draw!"
                gameActive = false
            } else {
                currentPlayer = currentPlayer == "X" ? "O" : "X"
                statusLabel.text = "Player \(currentPlayer)'s Turn"
            }
            
        }
        
    }
    
    
    func checkForWin() -> Bool {
           let winPatterns = [
               [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
               [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
               [0, 4, 8], [2, 4, 6]             // diagonals
           ]

           for pattern in winPatterns {
               if board[pattern[0]] == currentPlayer && board[pattern[1]] == currentPlayer && board[pattern[2]] == currentPlayer {
                   return true
               }
           }
           return false
       }
    
    @IBAction func resetButtonTapped(_ sender: UIButton){
        resetGame()
    }


}

