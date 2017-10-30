//
//  Score.swift
//  ScoresMVC
//
//  Created by Maribel Montejano on 10/29/17.
//  Copyright © 2017 Maribel Montejano. All rights reserved.
//

import Foundation

// MODEL
class Score {
    // Property
    var score: Int = 0
    
    // Method
    func setScore(input: String?) {
        
        // 1) Check to make sure the text field has a value
        if input != nil {
            // 2) Use optional binding to check if the value can be cast as an Int
            if let newScore = Int(input!) {
                // 3) Check if the Int value is greater than 0 (positive value)
                if newScore > 0 {
                    // 4) Set the score property
                    score = newScore
                }
            }
        }
    }
    
}
