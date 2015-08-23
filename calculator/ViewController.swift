//
//  ViewController.swift
//  calculator
//
//  Created by Mary Xia on 8/23/15.
//  Copyright (c) 2015 Mary Xia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        tipControl.selectedSegmentIndex = NSUserDefaults.standardUserDefaults().integerForKey("defaultTipIndex")
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tipPercentages = [0.16, 0.17, 0.18, 0.19, 0.21, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

