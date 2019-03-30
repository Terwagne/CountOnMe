//
//  CountOnMe.swift
//  CountOnMe
//
//  Created by ISABELLE Terwagne on 28/03/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation

class  CalculateBrain {
    

// MARK: - Properties
var stringNumbers: [String] = [String()]
var operators: [String] = ["+"]
var index = 0


// MARK: - Methodes

    func calculateTotal() {
        if !isExpressionCorrect {
            return
        }
        
        var total = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }
        
        textView.text = textView.text + "=\(total)"
        
        clear()
    }
    
    func updateDisplay() {
        var text = ""
        for (i, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            // Add number
            text += stringNumber
        }
        textView.text = text
    }
    
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        //        index = 0
    }
}
