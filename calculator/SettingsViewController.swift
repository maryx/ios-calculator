//
//  SettingsViewController.swift
//  calculator
//
//  Created by Mary Xia on 8/23/15.
//  Copyright (c) 2015 Mary Xia. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var canceButton: UIButton!
    
    var defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the UI to show the previously selected percentage
        tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTipIndex")
        // Add a field
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "updatedTipIndex")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onTipChange(sender: AnyObject) {
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "updatedTipIndex")
        defaults.synchronize()
    }

    @IBAction func onClickSave(sender: AnyObject) {
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "defaultTipIndex")
        defaults.synchronize()
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func onClickCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion:nil)
    }
}
