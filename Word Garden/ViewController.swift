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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
//        print("In viewDidLoad, is guessLetterField the first responder?", guessedLetterField.isFirstResponder)
    }
    
    func updateUIAfterGuess(){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
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
        updateUIAfterGuess()
//        print("In doneKeyPressed, is guessLetterField the first responder after updateUIGuessed?", guessedLetterField.isFirstResponder)
    }
    
    @IBAction func guessedLetterButtonPressed(_ sender: UIButton) {
//        print("In guessedLetterButtonPressed, is guessLetterField the first responder before updateUIGuessed?", guessedLetterField.isFirstResponder)
        updateUIAfterGuess()
//        print("In guessedLetterButtonPressed, is guessLetterField the first responder after updateUIGuessed?", guessedLetterField.isFirstResponder)
        
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
    }
    
}

