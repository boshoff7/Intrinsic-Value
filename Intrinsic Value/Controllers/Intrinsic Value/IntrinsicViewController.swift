//
//  IntrinsicViewController.swift
//  Intrinsic Value
//
//  Created by Chris Boshoff on 2022/03/04.
//

import UIKit

class IntrinsicViewController: UIViewController, IntrinsicResultProtocol, UITextFieldDelegate {

    
    @IBOutlet weak var epsTextField: UITextField!
    @IBOutlet weak var growthTextField: UITextField!
    @IBOutlet weak var returnTextField: UITextField!
    @IBOutlet weak var ratioTextField: UITextField!
    
    var resultDialog: IntrinsicResultViewController?
     
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialise the result dialog
        resultDialog = storyboard?.instantiateViewController(withIdentifier: "intrinsicResultVC") as? IntrinsicResultViewController
        // Customizing the style of the popup presentation 
        resultDialog?.modalPresentationStyle = .overCurrentContext
        
        epsTextField.delegate = self
        growthTextField.delegate = self
        returnTextField.delegate = self
        ratioTextField.delegate = self
 
    }

    @IBAction func calculationPressed(_ sender: UIButton) {
        
        let eps = Double(epsTextField.text!)
        let growth = Double(growthTextField.text!)
        let returnRate = Double(returnTextField.text!)
        let ratio = Double(ratioTextField.text!)
        
        
        if eps != nil && growth != nil && returnRate != nil && ratio != nil {
            
            let result1 = eps! * pow(1 + (growth!/100), 10)
            let result2 = result1 / pow((1 + returnRate!), 9) + 1
            let finalResult = String(format: "%.2f", result2)
            
            print(finalResult)
            
            
            
            // Show popup
            if resultDialog != nil {
                
                resultDialog!.fairValueText = finalResult
                present(resultDialog!, animated: true, completion: nil)
            }
            epsTextField.text = ""
            growthTextField.text = ""
            returnTextField.text = ""
            ratioTextField.text = ""

        } else {
            
            // Alert
            showAlert(title: "Error", message: "Please enter an amount for all boxes.")
        }
        
        

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
    
    func dialogDismissed() {
        
        epsTextField.text = ""
        growthTextField.text = ""
        returnTextField.text = ""
        ratioTextField.text = ""
     
    }
    
   
}
