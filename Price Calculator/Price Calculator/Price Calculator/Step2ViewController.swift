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
        var value = sender.value;
        
        shippingPercentage.text = "\(value)"
    }
    /*
    Get the shipping cost and let the user choose for the start and end valuta to calculate with
    */
    
    var StartWithData = ["USD"]

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
            let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Step3ViewController")
            self.navigationController?.pushViewController(newViewController!, animated: true)
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}