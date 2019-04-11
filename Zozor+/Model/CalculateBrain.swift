//
//  CountOnMe.swift
//  CountOnMe
//
//  Created by ISABELLE Terwagne on 28/03/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation
protocol CalculateBrainDelegate {
    func displayAlert(message: String)
    func updateText(label: String)
}

class  CalculateBrain {
// MARK: - Properties
var stringNumbers = [String()]
var operators = ["+"]
var clearAll = 1
var index = "0"
var total: Double = 0
var totalTrunc: Int = 0
var calculateBrainDelegate: CalculateBrainDelegate?

var isExpressionCorrect: Bool {
    if let stringNumber = stringNumbers.last {
        if stringNumber.isEmpty {
            if stringNumbers.count == 1 {
               calculateBrainDelegate?.displayAlert(message: "Démarrez un nouveau calcul!" )
            } else if stringNumbers.last == "" && operators.last != "%" {
                calculateBrainDelegate?.displayAlert(message: "Entrez une expression correcte!")
            }
            return false
        }
    }
    return true
    }
var canAddOperator: Bool {
    if let stringNumber = stringNumbers.last {
        if stringNumber.isEmpty && clearAll != 0 {
            calculateBrainDelegate?.displayAlert(message: "Expression incorrecte!")
                return false
            }
        }
        return true
    }

var canAddDecimal: Bool {
        if let strings = stringNumbers.last {
            if strings.contains(".") || strings.isEmpty {
                return false
            }
        }
        return true
    }
    

    
// MARK: - Methodes
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
        stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
        updateDisplay()
    }
    
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
    
func calculateTotal() {
        if !isExpressionCorrect {
            return
        }
    for (index, stringNumber) in stringNumbers.enumerated() {
        guard let number = Double(stringNumber) else{ return}
            switch operators[index] {
            case "+" :
               total += number
                 print("\(stringNumbers)")
                print("\(operators)")
                print("\(total)")
            case "-" :
               total -= number
                  print("\(stringNumbers)")
            case "%" :
                total = number+total
                print("\(total)")
                total -= (total*number)/100
                  print("\(stringNumbers)")
                print("\(total)")
            default:
                break
            }
    if total.truncatingRemainder(dividingBy: 1) == 0 {
        let totalTrunc = Int(total)
    calculateBrainDelegate?.updateText(label:"\(totalTrunc)")
    }else{
           calculateBrainDelegate?.updateText(label:"\(total)")
    }
    }
    
    }

    func plus() {
        if canAddOperator {
            operators.append("+")
            stringNumbers.append("")
            updateDisplay()
        }
    }
    func minus() {
        if canAddOperator {
            operators.append("-")
            stringNumbers.append("")
            updateDisplay()
        }
    }
    func percent() {
        if canAddOperator {
          print("\(stringNumbers)")
            operators.append("%")
             updateDisplay()
            stringNumbers.append("\(stringNumbers[1])")
            print("\(stringNumbers)")
           
        }
    }
   
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        index = "0"
        total = 0
        totalTrunc = 0
    }
    
    func clearButton() {
     clear()
        clearAll = 0
        var clearTotal = Int(total)
        clearTotal = 0
        calculateBrainDelegate?.updateText(label: "\(clearTotal)")
        print("\(operators)")
        
        }
    
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



