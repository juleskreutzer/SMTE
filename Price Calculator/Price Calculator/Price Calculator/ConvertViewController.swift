//
//  ConvertViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 23-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class ConvertViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    var StartWithData = ["Select a currency", "USD"]
    
    @IBOutlet weak var txtAmount: UITextField!
    @IBOutlet weak var CalculateButton: UIBarButtonItem!
    @IBOutlet weak var CalculateToPicker: UIPickerView!
    @IBOutlet weak var StartWithPicker: UIPickerView!
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var dict = NSUserDefaults.standardUserDefaults().objectForKey("USDrates")
        var data : Array<String> = []
        for(key, value) in dict as! NSDictionary
        {
            data.append(key as! String);
        }
        StartWithData.appendContentsOf(data)
        
        CalculateButton.tintColor = Colors.white
        
        StartWithPicker.dataSource = self
        CalculateToPicker.dataSource = self
        StartWithPicker.delegate = self
        CalculateToPicker.delegate = self
        

        // Do any additional setup after loading the view.
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return StartWithData.count
        
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return StartWithData[row]
    }

    func showError(message: String)
    {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func MakeCalculation(sender: AnyObject) {
        let startWithInt = StartWithPicker.selectedRowInComponent(0)
        let startWith = StartWithData[startWithInt]
        
        let calculateToInt = CalculateToPicker.selectedRowInComponent(0)
        let calculateTo = StartWithData[calculateToInt]
        print("\(startWith)\n\(calculateTo)")
        
        let amount : Double = Double(txtAmount.text!)!
        
        if(startWith == "Select a currency")
        {
            showError("Please select a currency to start the calculation with")
        }
        else if(calculateTo == "Select a currency")
        {
            showError("Please select a currency to calculate to")
        }
        else if(txtAmount.text?.isEmpty == true)
        {
            showError("Please enter an amount")
        }
        else
        {
            defaults.setObject(startWith , forKey: "startWith")
            defaults.setObject(calculateTo , forKey: "calculateTo")
            defaults.setObject("CONVERT", forKey: "Calctype")
            defaults.setDouble(amount, forKey: "amount")
            
            let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController")
            self.navigationController?.pushViewController(newViewController!, animated: true)
        }
    }
}
