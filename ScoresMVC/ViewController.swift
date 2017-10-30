//
//  ViewController.swift
//  ScoresMVC
//
//  Created by Maribel Montejano on 10/29/17.
//  Copyright © 2017 Maribel Montejano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var giantsScoreLabel: UILabel!
    @IBOutlet weak var visitorScoreLabel: UILabel!
    @IBOutlet weak var winningTeamLabel: UILabel!
    @IBOutlet weak var giantsScoreTextField: UITextField!
    @IBOutlet weak var visitorScoreTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set the View Controller as the delegate
        giantsScoreTextField.delegate = self
        visitorScoreTextField.delegate = self
    }

    // MARK: IBActions
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
    
    // MARK: Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        giantsScoreTextField.resignFirstResponder()
        visitorScoreTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // 1) Check which textField has been edited:
        if textField == giantsScoreTextField {
            // 2) Check to make sure the text field has a value
            if giantsScoreTextField.text != nil {
                // 3) Use optional binding to check if the value can be cast as an Int
                if let giantsScore = Int(giantsScoreTextField.text!) {
                    // 4) Check if the Int value is greater than 0 (positive value)
                    if giantsScore > 0 {
                        giantsScoreLabel.text = giantsScoreTextField.text
                    }
                }
            }
        }
        
        // Same as above, but for visitorScoreTextField
        if textField == visitorScoreTextField {
            if visitorScoreTextField.text != nil {
                if let visitorScore = Int(visitorScoreTextField.text!) {
                    if visitorScore > 0 {
                        visitorScoreLabel.text = visitorScoreTextField.text
                    }
                }
            }
        }
    }
}







