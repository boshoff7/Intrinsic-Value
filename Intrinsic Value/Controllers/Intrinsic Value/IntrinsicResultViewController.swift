//
//  IntrinsicResultViewController.swift
//  Intrinsic Value
//
//  Created by Chris Boshoff on 2022/03/06.
//

import UIKit

protocol IntrinsicResultProtocol {
    
    func dialogDismissed()
}

class IntrinsicResultViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var fairValueLabel: UILabel!
    @IBOutlet weak var recalculateButton: UIButton!
    
    var fairValueText = ""
    var delegate: IntrinsicResultProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Round the dialog box corners
        dialogView.layer.cornerRadius = 10

        
    }
    override func viewWillAppear(_ animated: Bool) {
        // Set the text
        fairValueLabel.text = fairValueText
        
        // Hide the UI elements
        dimView.alpha = 0
        fairValueLabel.alpha = 0
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        // Fade in the dimview
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.dimView.alpha = 1
            self.fairValueLabel.alpha = 1
        }, completion: nil)

    }
    
    
    @IBAction func recalculatePressed(_ sender: Any) {
        
            
    
        // Dismiss the popup
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.dimView.alpha = 1
        }) { (completed) in
            // Dismiss the popup
            self.dismiss(animated: true, completion: nil)
    
            // Notify delegate that the popup was dismissed
            self.delegate?.dialogDismissed()
  
        }
 

    }
    

}
