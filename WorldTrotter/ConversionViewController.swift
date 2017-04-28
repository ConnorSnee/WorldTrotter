//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Snee, Connor Patrick on 4/19/17.
//  Copyright © 2017 Snee, Connor Patrick. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //change the color of the background based upon the time of day when the tab is opene
    
    var farenheightValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = farenheightValue {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            let roundedValue = Double(round(100*value)/100)
            celsiusLabel.text = "\(roundedValue)"
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func farenheightFieldEditingChanged(textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            farenheightValue = value
        } else {
            farenheightValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)
        -> Bool {
            
            let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
            let replacementTextHasDecimalSeparator = string.range(of: ".")
            
            if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
                return false
            } else {
                return true
            }
    }
    
}
