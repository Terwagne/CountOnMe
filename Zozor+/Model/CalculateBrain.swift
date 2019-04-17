//
//  CountOnMe.swift
//  CountOnMe
//
//  Created by ISABELLE Terwagne on 28/03/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation

// ///////////////////////// //
// MARK: - PROTOCOLS//
// ///////////////////////// //

// MARK: - Protocol to display Alerts
protocol CalculateBrainDelegate {
    func displayAlert(message: String)
    func updateText(label: String)
}

class  CalculateBrain {
    
    // ///////////////////////// //
    // MARK: - PROPERTIES//
    // ///////////////////////// //
    
    var stringNumbers = [String()] // Array to stock numbers
    var operators = ["+"] // Array to stock operators
    var clearAll = 1 // variable to check if it's clear
    var index = "0" // variable to check Index
    var total: Double = 0 // variable to stock total when it is Double
    var totalTrunc: Int = 0 // variable to stock total when it is an Integer

    var calculateBrainDelegate: CalculateBrainDelegate? // initialisation extension
    
    /**
     Computed property that check if there is empty or have
     only one member in stringNumbers Array. If yes, It is not possible to launch an operation, alerts are display.
     */
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    calculateBrainDelegate?.displayAlert(message: "Démarrez un nouveau calcul!" )
                } else if stringNumbers.last == ("") && operators.last != "%" {
                    calculateBrainDelegate?.displayAlert(message: "Entrez une expression correcte!")
                }
                return false
            }
        }
        return true
    }
    
    /**
     Computed property that check if there is one number in stringNumber array.
     if yes, it is possible to add an operator. If No, Alert message is display.
     */
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty && clearAll != 0 {
                calculateBrainDelegate?.displayAlert(message: "Expression incorrecte!")
                return false
            }
        }
        return true
    }
    
    /**
     Computed property that check if there is a point in stringNumber array.
     if yes, it is a decimal
     */
    var canAddDecimal: Bool {
        if let strings = stringNumbers.last {
            if strings.contains(".") || strings.isEmpty {
                calculateBrainDelegate?.displayAlert(message: "Expression incorrecte!")
                return false
            }
        }
        return true
    }
    
    // ///////////////////////// //
    // MARK: - METHODS//
    // ///////////////////////// //
    
    /**
     Add new number in the stringNumbers Array and stock the former last one
     allows us to calculate numbers with more than one number
     */
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
        updateDisplay()
    }
    /**
     Add new  decimal number in the stringNumbers Array and stock the former last one
     allows us to calculate numbers with more than one number
     */
    
    func addDecimal(){
        if let stringNumber = stringNumbers.last {
            var stringNumberDecimal = stringNumber
            //Convert Int to String and append it to the former number
            stringNumberDecimal += "."
            // Replace formernumber with apended number
            stringNumbers[stringNumbers.count-1] = stringNumberDecimal
        }
        updateDisplay()
    }
    
    // method that  made calculation in fonction of the operand
    
    func calculateTotal() {
        if !isExpressionCorrect {
            return
        }
        for (index, stringNumber) in stringNumbers.enumerated() {
            guard let number = Double(stringNumber) else{ return}
            switch operators[index] {
            case "+" :
                total += number
            case "-" :
                total -= number
            case "%" :
                total = number+total
                total -= (total*number)/100
            default:
                break
            }
            //  condition to stock decimal or integre total
            if total.truncatingRemainder(dividingBy: 1) == 0 {
                let totalTrunc = Int(total)
                calculateBrainDelegate?.updateText(label:"\(totalTrunc)")
            }else{
                calculateBrainDelegate?.updateText(label:"\(total)")
            }
        }
       
    }
    
    
    
    //  method call when + is tapped
    func plus() {
        if canAddOperator {
            operators.append("+")
            stringNumbers.append("")
            updateDisplay()
        }
    }
    
    // method call when - is tapped
    func minus() {
        if canAddOperator {
            operators.append("-")
            stringNumbers.append("")
            updateDisplay()
        }
    }
    //  method call when % is tapped
    func percent() {
        if canAddOperator {
            operators.append("%")
            updateDisplay()
            stringNumbers.append("\(stringNumbers[1])")
        }
    }
    // method to clear
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        index = "0"
        total = 0
        totalTrunc = 0
    }
    //  method call when C is tapped - clear all
    func clearButton() {
     clear()
        clearAll = 0
        var clearTotal = Int(total)
        clearTotal = 0
        calculateBrainDelegate?.updateText(label: "\(clearTotal)")
    }
    // method that manage the display
    func updateDisplay() {
        var text = ""
        for (index, stringNumber) in stringNumbers.enumerated() {
            if operators.last != "%" {
                // Add operator
                if index > 0 {
                    text += operators[index]
                }
                // Add number
                text += stringNumber
            }else{
                text =  stringNumbers[0] + "-" + stringNumber + "%"
                
            }
            calculateBrainDelegate?.updateText(label: "\(text)")
        }
    }
}


