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
    

    @IBOutlet weak var lblNettoDist: UILabel!
    @IBOutlet weak var txtNettoDist: UITextField!
    
    @IBOutlet weak var txtDiscountPercentage: UITextField!
    @IBOutlet weak var discountSlider: UISlider!
    @IBOutlet weak var lblDiscount: UITextView!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func makeChange(sender: AnyObject) {
        if(switcher.on == true)
        {
            lblBrutoDist.hidden = true
            txtBrutoDist.hidden = true
            lblDiscount.hidden = true
            txtDiscountPercentage.hidden = true
            discountSlider.hidden = true
            lblNettoDist.hidden = false
            txtNettoDist.hidden = false
        }
        else if(switcher.on == false)
        {
            lblBrutoDist.hidden = false
            txtBrutoDist.hidden = false
            lblDiscount.hidden = false
            txtDiscountPercentage.hidden = false
            discountSlider.hidden = false
            lblNettoDist.hidden = true
            txtNettoDist.hidden = true
        }
    }

    @IBAction func sliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        txtDiscountPercentage.text = "\(currentValue)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        makeChange(self)
        navigationController?.navigationItem.backBarButtonItem?.tintColor = UIColor.whiteColor()
        discountSlider.thumbTintColor = Colors.green
        discountSlider.tintColor = Colors.orange
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(switcher.on == true)
        {
            defaults.setBool(true, forKey: "isNettoPrice")
            // we have a netto price now
            if (txtNettoDist.text?.isEmpty != true)
            {
                let wrongPrice : String = txtNettoDist.text!
                let rightPrice = wrongPrice.stringByReplacingOccurrencesOfString(",", withString: ".")
                let price : Double = Double(rightPrice)!
                
                defaults.setDouble(price, forKey: "nettoPrice")
                print(defaults.floatForKey("nettoPrice"))
                defaults.setObject("DEFAULT", forKey: "CalcType")
            }
            else{
                showError("Please fill in the netto distributor price.")
            }
        }
        else
        {
            defaults.setBool(false, forKey: "isNettoPrice")
            
            if(txtBrutoDist.text?.isEmpty != true)
            {
                let wrongPrice : String = txtBrutoDist.text!
                let rightPrice = wrongPrice.stringByReplacingOccurrencesOfString(",", withString: ".")
                let price : Double = Double(rightPrice)!
                
                defaults.setDouble(price, forKey: "brutoPrice")
                defaults.setObject("DEFAULT", forKey: "CalcType")
            }
            else
            {
                showError("Please fill in the distributor list price")
            }
            
            if(txtDiscountPercentage.text?.isEmpty != true)
            {
                let percentage : Double = Double(txtDiscountPercentage.text!)!
                defaults.setDouble(percentage, forKey: "discountPercentage")
                defaults.setObject("DEFAULT", forKey: "CalcType")
            }
            else
            {
                showError("Please fill in a discount percentage");
            }
        }
    }
    
    func showError(message: String)
    {
        let alert = UIAlertController(title: "Oops..", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
}
