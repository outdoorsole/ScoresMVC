//
//  ViewController.swift
//  ScoresMVC
//
//  Created by Maribel Montejano on 10/29/17.
//  Copyright © 2017 Maribel Montejano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    var giantsScore = Score()
    var visitorScore = Score()
    
    // MARK: Outlets
    @IBOutlet weak var giantsScoreLabel: UILabel!
    @IBOutlet weak var visitorScoreLabel: UILabel!
    @IBOutlet weak var winningTeamLabel: UILabel!
    @IBOutlet weak var giantsScoreTextField: UITextField!
    @IBOutlet weak var visitorScoreTextField: UITextField!

    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the View Controller as the delegate for both UITextFields
        giantsScoreTextField.delegate = self
        visitorScoreTextField.delegate = self
    }
    
    // MARK: UITextField delegate methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // resign responder for the textField that is active
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // Check which textField has been edited:
        if textField == giantsScoreTextField {
            
            // update the score property
            giantsScore.setScore(input: giantsScoreTextField.text)
            
            // update the score label
            giantsScoreLabel.text = String(giantsScore.score)
        }
        
        // Same as above, but for visitorScoreTextField
        if textField == visitorScoreTextField {
            
            // update the score property
            visitorScore.setScore(input: visitorScoreTextField.text)
            
            // update the score label
            visitorScoreLabel.text = String(visitorScore.score)
        }
    }


    // MARK: Actions
    
    // IBAction for tapping "who won?" button
    @IBAction func whoWon(_ sender: UIButton) {
        let giantsScore: Int = Int(giantsScoreLabel.text!)!
        let visitorScore: Int = Int(visitorScoreLabel.text!)!
        
        // Case 1: If Giants score is less, Visitor wins
        if giantsScore < visitorScore {
            winningTeamLabel.text = "Visitor"
            // Case 2: If Giants score is greater, Giants win
        } else if giantsScore > visitorScore {
            winningTeamLabel.text = "Giants"
            // Case 3: If the scores are the same, then tie
        } else {
            winningTeamLabel.text = "Tie"
        }
    }
}







