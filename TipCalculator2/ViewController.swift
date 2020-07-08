//
//  ViewController.swift
//  TipCalculator2
//
//  Created by Mariam Adams on 7/8/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var eachPayLabel: UILabel!
    @IBOutlet weak var eachPersonAmountLabel: UILabel!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var peopleSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateBillAmount() {
        let bill = Double(amountTextField.text!) ?? 0
        
        //Calculate the tip and total
        let tipPercentages = Double(Double(tipPercentageSlider.value) / 100)
        
        //Updating the total amount
        let tip = bill * tipPercentages
        let totalWithoutSplit = bill + tip
        totalAmountLabel.text = String(format: "$%0.2f", totalWithoutSplit)
        
        // Updating the people split
        let people = Int(peopleSlider.value)
        let eachPerson = totalWithoutSplit / Double(people)
        eachPersonAmountLabel.text = String(format: "$%0.02f", eachPerson)
        
        //calculateBill()
        
    }
    
    @IBAction func tipSliderValue(_ sender: Any) {
        tipPercentageLabel.text = String(format:"Tip: %d%%", Int(tipPercentageSlider.value))
        calculateBillAmount()
    }
    
    
    @IBAction func numberOfPeople(_ sender: Any) {
        splitLabel.text = String(format:"Split: %d", Int(peopleSlider.value))
        calculateBillAmount()
    }
    @IBAction func amount(_ sender: Any) {
        calculateBillAmount()
    }
    
    
}

