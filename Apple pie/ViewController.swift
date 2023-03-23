//
//  ViewController.swift
//  Apple pie
//
//  Created by Brandon Weber on 3/23/23.
//

import UIKit

var listOfWords = ["buccaner" , "swift" , "glorious" , "incandesent" , "bug" , "progam"]

let incorrectMovesAllowed = 7


class ViewController: UIViewController {

    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    @IBOutlet var treeImageView: UIImageView!
   
    @IBOutlet var correctWordLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       newRound()
    }

    var currentGame: game!
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = game(word: newWord,
            incorrectMovesRemaning: incorrectMovesAllowed,
            guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        }else {
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons
        {
            button.isEnabled = enable
        }
    }
    
    func updateUI () {
        var letters = [String]()
        for letter in currentGame.formattedWord{
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "tree \(currentGame.incorrectMovesRemaning)")
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updatedGameState()
        
        
        
    }
    
    func updatedGameState() {
        if currentGame.incorrectMovesRemaning   == 0 {
            totalLosses += 1
        }else if currentGame.word == currentGame.formattedWord  {
            totalWins += 1
        }else {
        updateUI()
        }
    }
    
    
    
    
    
    
}

