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
        self.view.backgroundColor = Colors.blue
        UITabBar.appearance().barTintColor = Colors.yellow
        // Do any additional setup after loading the view.
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
