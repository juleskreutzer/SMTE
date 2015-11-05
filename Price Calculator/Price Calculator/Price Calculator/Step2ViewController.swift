//
//  Step2ViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 15-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class Step2ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var shippingPercentage: UITextField!
    @IBOutlet weak var ShippingSlider: UISlider!
    @IBOutlet weak var StartWithPicker: UIPickerView!
    
    @IBOutlet weak var CalculateToPicker: UIPickerView!
    @IBAction func updateSlider(sender: UISlider) {
        var value = Int(sender.value)
        
        shippingPercentage.text = "\(value)"
    }
    /*
    Get the shipping cost and let the user choose for the start and end valuta to calculate with
    */
    
    var StartWithData = ["Select a currency", "USD"]
    
    var defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        StartWithPicker.dataSource = self
        CalculateToPicker.dataSource = self
        StartWithPicker.delegate = self
        CalculateToPicker.delegate = self
        
        ShippingSlider.thumbTintColor = Colors.green
        ShippingSlider.tintColor = Colors.orange

        var dict = NSUserDefaults.standardUserDefaults().objectForKey("USDrates")
        var data : Array<String> = []
        for(key, value) in dict as! NSDictionary
        {
            data.append(key as! String);
        }
        
        StartWithData.appendContentsOf(data)
        print(StartWithData)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe:"))
        
        rightSwipe.direction = .Left
        view.addGestureRecognizer(rightSwipe)
        
        // Do any additional setup after loading the view.
    }
    
    func handleSwipe(sender: UISwipeGestureRecognizer)
    {
        if(sender.direction == .Left)
        {
            var startInt = StartWithPicker.selectedRowInComponent(0)
            var endInt = CalculateToPicker.selectedRowInComponent(0)
            
            var start = StartWithData[startInt]
            var end = StartWithData[endInt]
            
            if(start == "Select a currency" || end == "Select a currency")
            {
                showError("Please select a start and/or end currency in the settings.")
            }

            if(shippingPercentage.text?.isEmpty == true)
            {
                showError("Please fill in the shipping cost percentage")
            }
            else
            {
                let wrongPercentage : String = shippingPercentage.text!
                let rightPercentage = wrongPercentage.stringByReplacingOccurrencesOfString(",", withString: ".")
                let percentage : Double = Double(rightPercentage)!
                
                defaults.setDouble(percentage, forKey: "shippingCost")
                
                let startWithInt = StartWithPicker.selectedRowInComponent(0)
                let startWith = StartWithData[startWithInt]
                
                let calculateToInt = CalculateToPicker.selectedRowInComponent(0)
                let calculateTo = StartWithData[calculateToInt]
                print("\(startWith)\n\(calculateTo)")
                
                defaults.setObject(startWith , forKey: "startWith")
                defaults.setObject(calculateTo , forKey: "calculateTo")
                let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Step3ViewController")
                self.navigationController?.pushViewController(newViewController!, animated: true)
            }
        }
        
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

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return StartWithData.count
        
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return StartWithData[row]
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
