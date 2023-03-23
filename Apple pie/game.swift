//
//  game.swift
//  Apple pie
//
//  Created by Brandon Weber on 3/23/23.
//

import Foundation

struct game {
    var word: String
    var incorrectMovesRemaning: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaning -= 1
        }
    }
        
        var formattedWord: String {
            var guessedWord = ""
            for letter in word {
                if guessedLetters.contains(letter){
                    guessedWord += "\(letter)"
                }else {
                    guessedWord += "_"
                }
            }
            return guessedWord
            
        }
        
    }
    
    
