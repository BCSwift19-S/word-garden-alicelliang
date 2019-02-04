//
//  ViewController.swift
//  Word Garden
//
//  Created by Alice Liang on 1/29/19.
//  Copyright © 2019 Alice Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    var wordToGuess = "CODE"
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
//        print("In viewDidLoad, is guessLetterField the first responder?", guessedLetterField.isFirstResponder)
    }
    
    func updateUIAfterGuess(){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
        
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord = revealedWord + " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    func guessALetter(){
        formatUserGuessLabel()
        guessCount += 1
        // decrements the wrongGuessesRemaining and shows the next flower image with one less pedal
        let currentLetterGuessed = guessedLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed){
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        
        let revealedWord = userGuessLabel.text!
        //stop game if wrongGuessesRemaining = 0
        if wrongGuessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "So sorry, you are all out of guesses. Try again?"
        } else if !revealedWord.contains("_"){
            //You've won the game!
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "You've got it! It took you \(guessCount) guesses to guess the word!"
        } else {
            //update our guess count
            let guess = ( guessCount == 1 ? "Guess" : "Guesses")
//            var guess = "guesses"
//            if guessCount == 1 {
//                guess = "guess"
//            }
            guessCountLabel.text = "You've Made \(guessCount) \(guess)"
        }
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
//        print("Hey, The guessedLetterFieldChanged!")
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = "\(letterGuessed)"
            guessLetterButton.isEnabled = true
        } else {
//            disable the button if I don't have a single character in the guessLetterField
            guessLetterButton.isEnabled = false
        }
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
//                print("In doneKeyPressed, is guessLetterField the first responder before updateUIGuessed?", guessedLetterField.isFirstResponder)
        guessALetter()
        updateUIAfterGuess()
//        print("In doneKeyPressed, is guessLetterField the first responder after updateUIGuessed?", guessedLetterField.isFirstResponder)
    }
    
    @IBAction func guessedLetterButtonPressed(_ sender: UIButton) {
//        print("In guessedLetterButtonPressed, is guessLetterField the first responder before updateUIGuessed?", guessedLetterField.isFirstResponder)
        guessALetter()
        updateUIAfterGuess()
//        print("In guessedLetterButtonPressed, is guessLetterField the first responder after updateUIGuessed?", guessedLetterField.isFirstResponder)
        
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessLetterButton.isEnabled = false
        flowerImageView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You've Made 0 Guesses"
        guessCount = 0
    }
    
}

