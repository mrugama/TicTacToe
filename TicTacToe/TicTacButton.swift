//
//  TicTacButton.swift
//  TicTacToe
//
//  Created by C4Q on 10/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class TicTacButton: UIButton {
    @IBInspectable var row: Int = 1
    @IBInspectable var col: Int = 1
    @IBOutlet var localizedTitle: String? = " " {
        didSet {
            self.setTitle(localizedTitle, for: .normal)
        }
    }
}
