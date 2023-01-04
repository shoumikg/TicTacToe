//
//  TicTacToeEngine.swift
//  TicTacToe
//
//  Created by Shoumic Ghosal on 04/01/23.
//

import Foundation

struct TicTacToeEngine {
  private var playerOneOccupiedCells : [Int] = []
  private var playerTwoOcuupiedCells : [Int] = []
  var resultOfTheGame: Int?
  var playerScores = [0,0]
  
  let winningTagCombinations = [
    [1,2,3],[4,5,6],[7,8,9],[1,4,7],
    [2,5,8],[3,6,9],[1,5,9],[3,5,7]
  ]
  
  mutating func occupyCell(isPLayerOne: Bool, cellTag: Int) {
    if isPLayerOne {
      playerOneOccupiedCells.insert(cellTag, at: playerOneOccupiedCells.endIndex)
    } else {
      playerTwoOcuupiedCells.insert(cellTag, at: playerTwoOcuupiedCells.endIndex)
    }
    if playerOneOccupiedCells.count > 2 {
      var winningCombinationFound: Bool?
      for combination in winningTagCombinations {
        for i in combination {
          if !(playerOneOccupiedCells.contains(i)) {
            winningCombinationFound = false
          }
        }
        if winningCombinationFound == nil {
          resultOfTheGame = 1
          playerScores[0] += 1
          break
        }
        winningCombinationFound = nil
      }
    }
    if playerTwoOcuupiedCells.count > 2  {
      var winningCombinationFound: Bool?
      for combination in winningTagCombinations {
        for i in combination {
          if !(playerTwoOcuupiedCells.contains(i)) {
            winningCombinationFound = false
          }
        }
        if winningCombinationFound == nil {
          resultOfTheGame = 2
          playerScores[1] += 1
          break
        }
        winningCombinationFound = nil
      }
    }
    if playerTwoOcuupiedCells.count + playerOneOccupiedCells.count == 9 {
      resultOfTheGame = 0
    }
  }
  
  mutating func restart() {
    resultOfTheGame = nil
    playerOneOccupiedCells = []
    playerTwoOcuupiedCells = []
  }
}
