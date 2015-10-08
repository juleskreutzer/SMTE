//
//  DefaultVarViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 08-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class DefaultVarViewController: UIViewController {
    @IBOutlet weak var switcher: UISwitch!
    
    @IBOutlet weak var lblBrutoDist: UILabel!
    @IBOutlet weak var txtBrutoDist: UITextField!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var txtDiscount: UITextField!
    @IBOutlet weak var lblNettoDist: UILabel!
    @IBOutlet weak var txtNettoDist: UITextField!
    
    @IBAction func makeChange(sender: AnyObject) {
        if(switcher.on == true)
        {
            lblBrutoDist.hidden = true
            txtBrutoDist.hidden = true
            lblDiscount.hidden = true
            txtDiscount.hidden = true
            lblNettoDist.hidden = false
            txtNettoDist.hidden = false
        }
        else if(switcher.on == false)
        {
            lblBrutoDist.hidden = false
            txtBrutoDist.hidden = false
            lblDiscount.hidden = true
            txtDiscount.hidden = true
            lblNettoDist.hidden = false
            txtNettoDist.hidden = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
