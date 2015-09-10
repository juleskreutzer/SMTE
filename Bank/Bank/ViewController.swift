
//
//  ViewController.swift
//  Bank
//
//  Created by Jules Kreutzer on 10-09-15.
//  Copyright (c) 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tb: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClick(sender: AnyObject) {
        tb.text = "Hallo"
    }

}

