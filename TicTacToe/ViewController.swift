//
//  ViewController.swift
//  TicTacToe
//
//  Created by Shoumic Ghosal on 03/01/23.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var cell00: UIButton!
  @IBOutlet weak var cell01: UIButton!
  @IBOutlet weak var cell02: UIButton!
  @IBOutlet weak var cell10: UIButton!
  @IBOutlet weak var cell11: UIButton!
  @IBOutlet weak var cell12: UIButton!
  @IBOutlet weak var cell20: UIButton!
  @IBOutlet weak var cell21: UIButton!
  @IBOutlet weak var cell22: UIButton!
  @IBOutlet weak var titleLabel: UILabel! {
    didSet {
      titleLabel.text = "TicTacToe Game"
      titleLabel.font = .boldSystemFont(ofSize: 20)
    }
  }
  @IBOutlet weak var playerLabel: UILabel! {
    didSet {
      playerLabel.text = "Player One's turn to play"
    }
  }
  
  private var playerOneTurn : Bool = true
  private var occupiedCells : Dictionary<Int, Int> = [:]
  
  @IBAction func cellClicked(_ sender: UIButton) {
    if sender.title(for: .normal) == nil {
      sender.setTitle(playerOneTurn ? "X" : "O", for: .normal)
      playerOneTurn.toggle()
      occupiedCells[sender.tag] = playerOneTurn ? 1 : 2
      sender.setTitleColor(.white, for: .normal)
      sender.setTitleColor(.white, for: .highlighted)
      playerLabel.text = playerOneTurn ? "Player One's turn to play" : "Player Two's turn to play"
    }
    if occupiedCells.count == 9 {
      playerLabel.text = "Game over!"
    }
  }
}

