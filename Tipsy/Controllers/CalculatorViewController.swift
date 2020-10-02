//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit


class CalculatorViewController: UIViewController {
    
    var currentButtonTitle: String = ""
    var tip: Double = 0
    var step: Int = 0
    var result: String = ""
    var selectedSenderTitle: String?
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billTextField.becomeFirstResponder()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        selectedSenderTitle = sender.currentTitle
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = Int(sender.value).description
        step = Int(splitNumberLabel.text!) ?? 0
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let num = Double(billTextField.text!) ?? 0
        let num2 = Double(step)
        let finalNum = String(format: "%.2f",(num + (num * tip)) / num2)
        result = finalNum
        
        performSegue(withIdentifier: "segueFromCalcToRes", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFromCalcToRes" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalValue = result
            destinationVC.numPeople = splitNumberLabel.text
            destinationVC.numPercent = selectedSenderTitle
        }
    }
}
