//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    // /////////////////// //
    // MARK: - PROPERTIES  //
    // /////////////////// //
    
    /// Instantiate model
    let calculateBrain = CalculateBrain()
    
    
    // ///////////////////////// //
    // MARK: - LIFECYCLE METHODS //
    // /////////////////////////
    
        override func viewDidLoad() {
        super.viewDidLoad()
        calculateBrain.calculateBrainDelegate = self
    }
    // /////////////////// //
    // MARK: - OUTLETS //
    // /////////////////// //
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet var operatorButtons: [UIButton]!
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    // /////////////////// //
    // MARK: - ACTIONS //
    // /////////////////// //
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (index, numberButton) in numberButtons.enumerated() where sender == numberButton {
            calculateBrain.addNewNumber(index)
        }
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            calculateBrain.plus()
        case 2:
            calculateBrain.minus()
        case 3 :
            calculateBrain.percent()
        case 4:
            calculateBrain.calculateTotal()
            calculateBrain.clear()
        default :
            break
        }
    }
    
    @IBAction func tappedClearButton(_ sender: UIButton) {
        calculateBrain.clearButton()
    }
    
    @IBAction func tappedDecimalButton(_ sender: Any) {
        if calculateBrain.canAddDecimal {
            calculateBrain.addDecimal()
            
        }
    }
}
// /////////////////// //
// MARK: - EXTENSIONS  //
// /////////////////// //
extension ViewController: CalculateBrainDelegate {
    
    func displayAlert(message: String) {
        let alert = UIAlertController(title: "zero", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func updateText(label: String) {
        textView.text = label
    }
}

