//
//  Step4ViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 15-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class Step4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let calculateButton = UIBarButtonItem(title: "Calculate", style: .Plain, target: self, action: Selector("ShowResultView"))
        navigationItem.rightBarButtonItem = calculateButton
        calculateButton.title = "Calculate"
        calculateButton.tintColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ShowResultView()
    {
        let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController")
        self.navigationController?.pushViewController(newViewController!, animated: true)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
