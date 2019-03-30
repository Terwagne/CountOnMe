//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  

    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    
    //    MARK: - propriete
    var calculateBrain = CalculateBrain()
    
    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                addNewNumber(i)
            }
        }
    }

    @IBAction func plus() {
        if canAddOperator {
        	calculateBrain.operators.append("+")
        	calculateBrain.stringNumbers.append("")
            calculateBrain.updateDisplay()
        }
    }

    @IBAction func minus() {
        if canAddOperator {
            calculateBrain.operators.append("-")
            calculateBrain.stringNumbers.append("")
            calculateBrain.updateDisplay()
        }
    }

    @IBAction func equal() {
        calculateBrain.calculateTotal()
    }

    var isExpressionCorrect: Bool {
        if let stringNumber = calculateBrain.stringNumbers.last {
            if stringNumber.isEmpty {
                if calculateBrain.stringNumbers.count == 1 {
                    let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertVC, animated: true, completion: nil)
                } else {
                    let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertVC, animated: true, completion: nil)
                }
                return false
            }
        }
        return true
    }
    
    var canAddOperator: Bool {
        if let stringNumber = calculateBrain.stringNumbers.last {
            if stringNumber.isEmpty {
                let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
                return false
            }
        }
        return true
    }    // MARK: - Methods

    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = calculateBrain.stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            calculateBrain.stringNumbers[stringNumber.count-1] = stringNumberMutable
        }
        calculateBrain.updateDisplay()
    }


}
