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
    @IBOutlet weak var discountSlider: UISlider!
    @IBOutlet weak var lblDistPrice: UILabel!
    @IBOutlet weak var txtDistPrice: UITextField!
    @IBOutlet weak var txtNettoDistPrice: UITextField!
    @IBOutlet weak var lblNettoDistPrice: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var lblDiscPercentage: UILabel!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeChange(self)
        navigationController?.navigationItem.backBarButtonItem?.tintColor = UIColor.whiteColor()
        discountSlider.thumbTintColor = Colors.green
        discountSlider.tintColor = Colors.orange
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe:"))
        
        rightSwipe.direction = .Left
        view.addGestureRecognizer(rightSwipe)

        // Do any additional setup after loading the view.
    }
    
    // Handle swipes from right to left
    // http://www.ioscreator.com/tutorials/detecting-swipe-gesture-tutorial-ios8-swift
    func handleSwipe(sender: UISwipeGestureRecognizer)
    {
        if(sender.direction == .Left)
        {
            defaults.setObject("CUSTOM", forKey: "Calctype")
            if(switcher.on == true)
            {
                defaults.setBool(true, forKey: "isNettoPrice")
                // we have a netto price now
                if (txtNettoDistPrice.text?.isEmpty == false)
                {
                    let wrongPrice : String = txtNettoDistPrice.text!
                    let rightPrice = wrongPrice.stringByReplacingOccurrencesOfString(",", withString: ".")
                    let price : Double = Double(rightPrice)!
                    
                    defaults.setDouble(price, forKey: "nettoPrice")
                    print(defaults.floatForKey("nettoPrice"))
                    
                    let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Step2ViewController")
                    self.navigationController?.pushViewController(newViewController!, animated: true)
                }
                else{
                    showError("Please fill in the netto distributor price.")
                }
            }
            else
            {
                if(txtDistPrice.text?.isEmpty == false && txtDiscountPercentage.text?.isEmpty == false)
                {
                    let wrongPrice : String = txtDistPrice.text!
                    let rightPrice = wrongPrice.stringByReplacingOccurrencesOfString(",", withString: ".")
                    let price : Double = Double(rightPrice)!
                    
                    defaults.setDouble(price, forKey: "brutoPrice")
                    print(defaults.floatForKey("brutoPrice"))
                    
                    let percentage : Double = Double(txtDiscountPercentage.text!)!/100
                    defaults.setDouble(percentage, forKey: "discountPercentage")
                    print(defaults.floatForKey("discountPercentage"))

                    
                    let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Step2ViewController")
                    self.navigationController?.pushViewController(newViewController!, animated: true)
                }
                else
                {
                    showError("Please fill in the distributor list price")
                }
            }
        }
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
    
    func showError(message: String)
    {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
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


}
