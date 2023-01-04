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
      playerLabel.font = .systemFont(ofSize: 14)
    }
  }
  
  @IBOutlet weak var scoreLabel: UILabel! {
    didSet {
      scoreLabel.text = "Scores"
      scoreLabel.font = .boldSystemFont(ofSize: 12)
    }
  }
  
  @IBOutlet weak var playerOneScore: UILabel! {
    didSet {
      playerOneScore.text = "Player One: \(model.playerScores[0])"
      playerOneScore.font = .systemFont(ofSize: 12)
    }
  }
  
  @IBOutlet weak var playerTwoScore: UILabel! {
    didSet {
      playerTwoScore.text = "Player Two: \(model.playerScores[1])"
      playerTwoScore.font = .systemFont(ofSize: 12)
    }
  }
  
  @IBOutlet weak var restartButton: UIButton! {
    didSet {
      restartButton.setTitle("Restart", for: .normal)
    }
  }
  
  private var playerOneTurn : Bool = true
  private var model = TicTacToeEngine()
  
  @IBAction func restartButtonClicked(_ sender: UIButton) {
    model.restart()
    cell00.setTitle("", for: .normal)
    cell01.setTitle("", for: .normal)
    cell02.setTitle("", for: .normal)
    cell10.setTitle("", for: .normal)
    cell11.setTitle("", for: .normal)
    cell12.setTitle("", for: .normal)
    cell20.setTitle("", for: .normal)
    cell21.setTitle("", for: .normal)
    cell22.setTitle("", for: .normal)
    playerOneTurn = true
    playerLabel.text = "Player One's turn to play"
    playerLabel.font = .systemFont(ofSize: 14)
    playerLabel.textColor = .black
    playerOneScore.text = "Player One: \(model.playerScores[0])"
    playerTwoScore.text = "Player Two: \(model.playerScores[1])"
  }
  
  @IBAction func cellClicked(_ sender: UIButton) {
    if model.resultOfTheGame == nil {
      
    }
    if sender.title(for: .normal) == nil || sender.title(for: .normal) == "" {
      sender.setTitle(playerOneTurn ? "X" : "O", for: .normal)
      model.occupyCell(isPLayerOne: playerOneTurn, cellTag: sender.tag)
      playerOneTurn.toggle()
      sender.setTitleColor(.white, for: .normal)
      sender.setTitleColor(.white, for: .highlighted)
      playerLabel.text = playerOneTurn ? "Player One's turn to play" : "Player Two's turn to play"
    }
    if let result =  model.resultOfTheGame {
      switch result {
      case 0 : playerLabel.text = "Game Over!"
      case 1: playerLabel.text = "Player 1 won!"
      case 2: playerLabel.text = "Player 2 won!"
      default:
        break
      }
      playerLabel.textColor = .red
      playerLabel.font = .systemFont(ofSize: 40)
    }
  }
}

