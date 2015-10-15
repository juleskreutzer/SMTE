//
//  Step3ViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 15-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class Step3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe:"))
        
        rightSwipe.direction = .Left
        view.addGestureRecognizer(rightSwipe)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleSwipe(sender: UISwipeGestureRecognizer)
    {
        if(sender.direction == .Left)
        {
            let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Step4ViewController")
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

}
