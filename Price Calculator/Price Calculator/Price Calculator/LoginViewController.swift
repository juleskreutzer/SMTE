//
//  LoginViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 09-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var btnLogin: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.tintColor = Colors.green

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doLogin(sender: AnyObject) {
        // Show a message that login is not implemented yet
        let alertController = UIAlertController(title: "Login", message: "Sorry, but the login function isn't available yet.", preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
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
