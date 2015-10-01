//
//  DetailsViewController.swift
//  Practicum 3
//
//  Created by Jules Kreutzer on 17-09-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit


class DetailsViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLife: UILabel!
    @IBOutlet weak var lblActiveYears: UILabel!
    @IBOutlet weak var lblCountryOfOrigin: UILabel!
    @IBOutlet weak var lblcomments: UITextView!

    
    var selectedPirate: Pirate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblName.text = self.selectedPirate?.name
        self.lblLife.text = self.selectedPirate?.life
        self.lblActiveYears.text = self.selectedPirate?.yearsActive
        //self.lblCountryOfOrigin.text = self.selectedPirate?.countryOrigin
        self.lblcomments.text = self.selectedPirate?.comments
        
        



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
