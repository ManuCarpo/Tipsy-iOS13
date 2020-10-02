//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Emanuele Carpigna on 29/09/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalValue: String?
    var numPeople: String?
    var numPercent: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalValue
        settingsLabel.text = "Split between \(numPeople ?? "2") people, with \(numPercent ?? "10%") tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }

}
