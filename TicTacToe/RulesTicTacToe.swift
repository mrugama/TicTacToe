//
//  RulesTicTacToe.swift
//  TicTacToe
//
//  Created by C4Q on 10/19/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
import UIKit

class TicTacToeRules {
    let winnerMov = [[(1,1),(1,2),(1,3)],
                    [(2,1),(2,2),(2,3)],
                    [(3,1),(3,2),(3,3)],
                    [(1,1),(2,1),(3,1)],
                    [(1,2),(2,2),(3,2)],
                    [(1,3),(2,3),(3,3)],
                    [(1,1),(2,2),(3,3)],
                    [(3,1),(2,2),(1,3)]]
    var playerOne: [(Int,Int)] = []
    var playerTwo: [(Int,Int)] = []
    var player: Bool = true
    func fnMovement(userMov: (Int,Int)) {
        if player {
            playerOne.append(userMov)
        } else {
            playerTwo.append(userMov)
        }
    }
    func fnSwitchPlayer(player: Bool) {
        if player {
            self.player = false
        } else {
            self.player = true
        }
    }
    func fnIsWinner(userMov: [(Int,Int)]) -> Bool {
        var counter = 0
        var colum = 0
        for position in winnerMov {
            for win in position where colum < 3 {
                for play in userMov {
                    if play == win {
                        counter += 1
                        if counter == 3 {
                            return true
                        }
                    }
                }
                colum += 1
            }
            colum = 0
            counter = 0
        }
        return counter == 3 ? true : false
    }
}
