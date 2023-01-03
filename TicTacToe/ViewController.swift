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
  
  private var playerOneTurn : Bool = true
  
  @IBAction func cellClicked(_ sender: UIButton) {
    print("Button clicked!")
    sender.setTitle(playerOneTurn ? "X" : "O", for: .normal)
    playerOneTurn.toggle()
    sender.setTitleColor(.white, for: .normal)
  }
}

