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
    @IBOutlet weak var infoLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultVars.tintColor = Colors.green
        customVars.tintColor = Colors.green
        //defaultVars.backgroundColor = Colors.blue
        //customVars.backgroundColor = Colors.blue
        self.view.backgroundColor = UIColor.whiteColor()
        navigationController?.navigationBar.barTintColor = Colors.green
        tabBarController!.tabBar.barTintColor = Colors.orange
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var startWith : String = defaults.objectForKey("DefaultStartCurrency") as! String
        var calculateTo : String = defaults.objectForKey("DefaultEndCurrency") as! String
        
        infoLabel.text = "Calculate from \(startWith) to \(calculateTo)"
        
        // Retrieve the exchange data from fixer.io
        var gotData = exchangeRates.getExchangeRates()
        if(gotData == false)
        {
            showError()
        }
        var data = defaults.objectForKey("USDrates")?.objectForKey("AUD")
        print(data);
        print(defaults.objectForKey("EURrates")?.objectForKey("USD"))
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe:"))
        
        rightSwipe.direction = .Left
        view.addGestureRecognizer(rightSwipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleSwipe(sender : UISwipeGestureRecognizer)
    {
        if(sender.direction == .Right)
        {
            let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SettingsTableViewController")
            self.navigationController?.pushViewController(newViewController!, animated: true)

        }
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
    
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    func showError()
    {
        
        let alert = UIAlertController(title: "Oops..", message: "We couldn't load the currency from the server.\nWe will use the data from last time.", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }


}
