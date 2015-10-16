//
//  ResultViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 11-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController,UINavigationBarDelegate {

    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 64))
        
        navigationBar.barTintColor = Colors.green
        
        navigationBar.delegate = self;
        navigationBar.tintColor = Colors.white
        
        
        let navigationItem = UINavigationItem()
        navigationItem.title = "Result"
        
        let leftItem = UIBarButtonItem(title: "Restart", style: .Plain, target: self, action: Selector("RestartAction"))
        leftItem.tintColor = Colors.white
        let rightItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: Selector("ShareAction"))
        rightItem.tintColor = Colors.white
        
        navigationItem.leftBarButtonItem = leftItem
        navigationItem.rightBarButtonItem = rightItem
        
        navigationBar.items = [navigationItem]
        
        self.view.addSubview(navigationBar)
        
        
        print(defaults.objectForKey("exchangeEUR"))
        print(defaults.objectForKey("exchangeUSD"))
        
        Calculate()
        
        

        // Do any additional setup after loading the view.
    }
    
    func RestartAction()
    {
        let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RestartView")
        self.navigationController?.pushViewController(newViewController!, animated: true)
        
    }
    
    func ShareAction()
    {
        showError("Share function not implemented here yet.")
        
    }
    
    func Calculate()
    {
        if(defaults.boolForKey("customCal") == true)
        {
            // Calculation with custom values
            print("Custom vars")
        }
        else
        {
            // Calculation with default values
            print("Default vars")
        }
    }
    
    func showError(message: String)
    {
        let alert = UIAlertController(title: "Oops..", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
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

}
