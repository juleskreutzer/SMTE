//
//  Step4ViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 15-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class Step4ViewController: UIViewController {
    @IBOutlet weak var txtMargin: UITextField!

    @IBOutlet weak var sliderMargin: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderMargin.thumbTintColor = Colors.green
        sliderMargin.tintColor = Colors.orange

        let calculateButton = UIBarButtonItem(title: "Calculate", style: .Plain, target: self, action: Selector("ShowResultView"))
        navigationItem.rightBarButtonItem = calculateButton
        calculateButton.title = "Calculate"
        calculateButton.tintColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ShowResultView()
    {
        let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController")
        self.navigationController?.pushViewController(newViewController!, animated: true)

    }
    
    @IBAction func SliderMarginChanged(sender: UISlider) {
        let value = Int(sender.value)
        txtMargin.text = "\(value)"
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
