//
//  ViewController.swift
//  TicTacToe
//
//  Created by C4Q on 10/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var buttons: [TicTacButton] = []
    var ticTacRules = TicTacToeRules()
    @IBOutlet weak var lblWinPlayer: UILabel!
    @IBOutlet weak var lblPlayerTurn: UILabel!
    
    @IBOutlet weak var btnOne: TicTacButton!
    @IBOutlet weak var btnTwo: TicTacButton!
    @IBOutlet weak var btnThree: TicTacButton!
    @IBOutlet weak var btnFour: TicTacButton!
    @IBOutlet weak var btnFive: TicTacButton!
    @IBOutlet weak var btnSix: TicTacButton!
    @IBOutlet weak var btnSeven: TicTacButton!
    @IBOutlet weak var btnEight: TicTacButton!
    @IBOutlet weak var btnNine: TicTacButton!
    
    @IBAction func btnPressed(_ sender: TicTacButton) {
        if ticTacRules.player {
            sender.setTitle("X", for: .normal)
            sender.isEnabled = false
            ticTacRules.fnMovement(userMov: (sender.row,sender.col))
            if ticTacRules.fnIsWinner(userMov: ticTacRules.playerOne) {
                lblWinPlayer.text = "Player One Wins!"
                lblWinPlayer.isHidden = false
            } else {
                ticTacRules.fnSwitchPlayer(player: ticTacRules.player)
                lblPlayerTurn.text = "Player Two's Turn"
            }
        } else {
            sender.setTitle("O", for: .normal)
            sender.isEnabled = false
            ticTacRules.fnMovement(userMov: (sender.row,sender.col))
            if ticTacRules.fnIsWinner(userMov: ticTacRules.playerTwo) {
                lblWinPlayer.text = "Player Two Wins!"
                lblWinPlayer.isHidden = false
            } else {
                ticTacRules.fnSwitchPlayer(player: ticTacRules.player)
                lblPlayerTurn.text = "Player One's Turn"
            }
        }
    }
    
    @IBAction func btnReset(_ sender: UIButton) {
        reset()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [btnOne, btnTwo,
                   btnThree, btnFour,
                   btnFive, btnSix,
                   btnSeven, btnEight, btnNine]
        reset()
    }

    func reset() {
        lblWinPlayer.isHidden = true
        lblPlayerTurn.text = "Player One's Turn"
        for button in buttons {
            button.setTitle(" ", for: .normal)
            button.isEnabled = true
            ticTacRules.playerOne = []
            ticTacRules.playerTwo = []
            ticTacRules.player =  true
        }
    }

}

