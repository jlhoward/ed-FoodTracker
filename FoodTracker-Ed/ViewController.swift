//
//  ViewController.swift
//  FoodTracker-Ed
//
//  Created by Jeff Howard on 11/5/16.
//  Copyright © 2016 Jeff Howard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

// MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
            mealNameLabel.text = "Default Text"
    }
    
    
// MARK:  Old Code
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
}

