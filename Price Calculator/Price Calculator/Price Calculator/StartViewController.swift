//
//  StartViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 02-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak var defaultVars: UIButton!
    @IBOutlet weak var customVars: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultVars.tintColor = Colors.green
        customVars.tintColor = Colors.green
        //defaultVars.backgroundColor = Colors.blue
        //customVars.backgroundColor = Colors.blue
        self.view.backgroundColor = UIColor.whiteColor()
        navigationController?.navigationBar.barTintColor = Colors.green
        tabBarController!.tabBar.barTintColor = Colors.orange
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
 
    @IBAction func showInfo(sender: AnyObject) {
        let alertController = UIAlertController(title: "Price Calculator", message: "Calculate your list price based on values you have stored in your settings, or enter custom values for this calculation", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func showLogin(sender: AnyObject) {
        let alertController = UIAlertController(title: "Login", message: "Sorry, but the login function isn't available yet.", preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }

}
