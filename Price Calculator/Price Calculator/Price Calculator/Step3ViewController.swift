//
//  Step3ViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 15-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class Step3ViewController: UIViewController {

    @IBOutlet weak var txtTax: UITextField!
    @IBOutlet weak var txtCorrection: UITextField!
    
    @IBOutlet weak var taxSlider: UISlider!
    @IBOutlet weak var correctionSlider: UISlider!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taxSlider.thumbTintColor = Colors.green
        taxSlider.tintColor = Colors.orange
        correctionSlider.thumbTintColor = Colors.green
        correctionSlider.tintColor = Colors.orange
        
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
            if(txtTax.text?.isEmpty == true)
            {
                showError("Please fill in the import tax")
            }
            else if(txtCorrection.text?.isEmpty == true)
            {
                showError("Please fill in the exchange rate correction")
            }
            else
            {
                let wrongTax = txtTax.text!
                let rightTax = wrongTax.stringByReplacingOccurrencesOfString(",", withString: ".")
                let tax : Float = Float(rightTax)!
                
                let wrongCorrection = txtCorrection.text!
                let rightCorrection = wrongCorrection.stringByReplacingOccurrencesOfString(",", withString: ".")
                let correction : Float = Float(rightCorrection)!
                
                defaults.setFloat(tax, forKey: "tax")
                defaults.setFloat(correction, forKey: "correction")
                let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Step4ViewController")
                self.navigationController?.pushViewController(newViewController!, animated: true)
                
            }
            
        }
        
    }
    
    @IBAction func TaxSliderChanged(sender: UISlider) {
        let value = Int(sender.value)
        txtTax.text = "\(value)"
    }

    @IBAction func CorrectionSliderChanged(sender: UISlider) {
        var value = Int(sender.value)
        txtCorrection.text = "\(value)"
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
    
    func showError(message: String)
    {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        
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
