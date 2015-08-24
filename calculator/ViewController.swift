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
    @IBOutlet weak var settingsButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        tipLabel.text = "$0.00"
        tipControl.selectedSegmentIndex = NSUserDefaults.standardUserDefaults().integerForKey("defaultTipIndex")
        totalLabel.text = "$0.00"
        totalLabel.alpha = 0
        tipLabel.alpha = 0
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        totalLabel.frame = CGRect(x: 56, y: 352, width: 248, height: 45)
        totalLabel.alpha = 0
        tipLabel.frame = CGRect(x: 156, y: 193, width: 248, height: 42)
        tipLabel.alpha = 0

        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tipPercentages = [0.16, 0.17, 0.18, 0.19, 0.21, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

        var animationTime = 0.4
        if (object_getClass(sender).description() == "UISegmentedControl") {
            animationTime = 0.1
        }
        UIView.animateWithDuration(animationTime,
            delay: animationTime*2,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: {
                self.totalLabel.frame = CGRect(x: 56, y: 252, width: 248, height: 45)
                self.totalLabel.alpha = 1
                self.tipLabel.frame = CGRect(x: 56, y: 193, width: 248, height: 42)
                self.tipLabel.alpha = 1
            },
            completion: nil
        )
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

