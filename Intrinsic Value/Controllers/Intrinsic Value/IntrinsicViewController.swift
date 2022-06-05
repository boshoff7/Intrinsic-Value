//
//  IntrinsicViewController.swift
//  Intrinsic Value
//
//  Created by Chris Boshoff on 2022/03/04.
//

import UIKit

class IntrinsicViewController: UIViewController {
    
    
    @IBOutlet weak var epsTextField: UITextField!
    @IBOutlet weak var growthTextField: UITextField!
    @IBOutlet weak var ratioTextField: UITextField!
    
    var resultDialog: IntrinsicResultViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextFields()
        
        // Initialise the result dialog
        resultDialog = storyboard?.instantiateViewController(withIdentifier: "intrinsicResultVC") as? IntrinsicResultViewController
        // Customizing the style of the popup presentation
        resultDialog?.modalPresentationStyle = .overCurrentContext
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        epsTextField.becomeFirstResponder()
    }
    
    private func setupTextFields() {
        epsTextField.addDoneButton()
        growthTextField.addDoneButton()
        ratioTextField.addDoneButton()
//        self.epsTextField.keyboardType = UIKeyboardType.decimalPad
//        self.growthTextField.keyboardType = UIKeyboardType.decimalPad
//        self.ratioTextField.keyboardType = UIKeyboardType.decimalPad
    }

    @IBAction func calculationPressed(_ sender: UIButton) {
        
        let eps = epsTextField.text?.converted?.dubleValue
        let rate = epsTextField.text?.converted?.dubleValue
        let ratio = epsTextField.text?.converted?.dubleValue
        
//        let eps = Double(conveps!)
//        let rate = Double(growthTextField.text!)
//        let ratio = Double(ratioTextField.text!)
       
        if eps != nil && rate != nil && ratio != nil {
        
        let calculation = (eps! * (1 + rate!) * ratio!)
        let result = String(format: "%.2f", calculation)
            
            epsTextField.text = ""
            growthTextField.text = ""
            ratioTextField.text = ""
        
        // Show popup
            if resultDialog != nil {
        
                resultDialog?.fairValueText = result
                present(resultDialog!, animated: true, completion: nil)
            }
            } else {
        
            // Alert
            showAlert(title: "Error", message: "Please enter an amount for all boxes.")
            }

    }
    
    private func calculation(eps: Double, rate: Double, ratio: Double) -> Double {
        
        return eps * (1 + rate) * ratio
        
    }

    func showAlert(title: String, message: String) {
        
        // Create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Add a button for the user to dismiss it
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        // Show the alert
        present(alert, animated: true, completion: nil)
    }
}

//let eps = Double(epsTextField.text!)
//let growth = Double(growthTextField.text!)
//let returnRate = Double(returnTextField.text!)
//let ratio = Double(ratioTextField.text!)
//
//
//if eps != nil && growth != nil && returnRate != nil && ratio != nil {
//
//    let result1 = eps! * pow(1 + (growth!/100), 10)
//    let result2 = result1 / pow((1 + returnRate!), 9) + 1
//    let finalResult = String(format: "%.2f", result2)
//
//    print(finalResult)
//
//    epsTextField.text = ""
//    growthTextField.text = ""
//    returnTextField.text = ""
//    ratioTextField.text = ""
//
//
//    // Show popup
//    if resultDialog != nil {
//
//        resultDialog!.fairValueText = finalResult
//        present(resultDialog!, animated: true, completion: nil)
//    }
//
//
//} else {
//
//    // Alert
//    showAlert(title: "Error", message: "Please enter an amount for all boxes.")
//}


