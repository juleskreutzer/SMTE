//
//  ProViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 18-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class ProViewController: UIViewController {

    @IBOutlet weak var NavigationBar: UINavigationBar!
    @IBOutlet weak var RestorePurchaseButton: UIBarButtonItem!
    @IBOutlet weak var buyButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NavigationBar.tintColor = Colors.green
        NavigationBar.backgroundColor = Colors.green
        RestorePurchaseButton.tintColor = Colors.white

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func GoPro(sender: AnyObject) {
        showError("You own the pro version at this moment, in-app purchase not implemented yet.")
    }
    
    func showError(message: String)
    {
        let alert = UIAlertController(title: "Oops..", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
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
