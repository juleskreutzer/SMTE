//
//  CustomVarViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 09-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class CustomVarViewController: UIViewController {

    @IBOutlet weak var txtDiscountPercentage: UITextField!
    @IBOutlet weak var lblDiscPercentage: UITextView!
    @IBOutlet weak var discountSlider: UISlider!
    @IBOutlet weak var lblDistPrice: UILabel!
    @IBOutlet weak var txtDistPrice: UITextField!
    @IBOutlet weak var txtNettoDistPrice: UITextField!
    @IBOutlet weak var lblNettoDistPrice: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        makeChange(self)
        navigationController?.navigationItem.backBarButtonItem?.tintColor = UIColor.whiteColor()
        discountSlider.thumbTintColor = Colors.green
        discountSlider.tintColor = Colors.orange

        // Do any additional setup after loading the view.
    }
    @IBAction func sliderValueChanged(sender: UISlider) {
        let value = Int(sender.value)
        txtDiscountPercentage.text = "\(value)"
    }
    
    // Create default settings
    let settings = NSUserDefaults.standardUserDefaults()
    
    @IBAction func makeChange(sender: AnyObject) {
       if(switcher.on == true)
       {
        lblDiscPercentage.hidden = true
        discountSlider.hidden = true
        lblDistPrice.hidden = true
        txtDistPrice.hidden = true
        txtDiscountPercentage.hidden = true
        txtNettoDistPrice.hidden = false
        lblNettoDistPrice.hidden = false
        }
        else
       {
        lblDiscPercentage.hidden = false
        discountSlider.hidden = false
        lblDistPrice.hidden = false
        txtDistPrice.hidden = false
        txtDiscountPercentage.hidden = false
        txtNettoDistPrice.hidden = true
        lblNettoDistPrice.hidden = true
        }
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
    @IBAction func test(sender: AnyObject) {
        if(switcher.on)
        {
            settings.setBool(false, forKey: "NettoPrice")
        }
        else
        {
            settings.setBool(true, forKey: "NettoPrice")
        }
        
        settings.setDouble(Double(txtDistPrice.text!)!, forKey: "BrutoDistPrice")
        settings.setDouble(Double(txtDiscountPercentage.text!)!, forKey: "BrutoDiscPercentage")
        settings.setDouble(Double(txtNettoDistPrice.text!)!, forKey: "NettoDistPrice")
        
        let alertController = UIAlertController(title: "Entered Values:", message: "BrutoDistPrice: " + String(settings.doubleForKey("BrutoDistPrice")), preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)

    }

}
