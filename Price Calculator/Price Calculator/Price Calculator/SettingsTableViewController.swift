//
//  TableViewController.swift
//  Price Calculator
//
//  Created by Fhict on 08/10/15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController,UIPickerViewDataSource,UIPickerViewDelegate{

    @IBOutlet weak var StartCurrency: UIPickerView!
    @IBOutlet weak var lblStartCurrency: UILabel!
    @IBOutlet weak var EndCurrency: UIPickerView!
    @IBOutlet weak var lblEndCurrency: UILabel!
    @IBOutlet weak var tbShippingCost: UITextField!
    @IBOutlet weak var tbExchangeRateCorrection: UITextField!
    @IBOutlet weak var tbImportTax: UITextField!
    @IBOutlet weak var tbProfitMargin: UITextField!
    
    
    @IBOutlet weak var MainTable: UITableView!
    @IBOutlet weak var CurrencyCell1: UITableViewCell!
    @IBOutlet weak var CurrencyCell2: UITableViewCell!
    @IBOutlet weak var CurrencyCell3: UITableViewCell!
    @IBOutlet weak var CurrencyCell4: UITableViewCell!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    var pickerData = ["Select a Currency", "USD"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var dict = NSUserDefaults.standardUserDefaults().objectForKey("USDrates")
        var data : Array<String> = []
        for(key, value) in dict as! NSDictionary
        {
            pickerData.append(key as! String);
        }
        
        navigationController?.navigationBar.barTintColor = Colors.green
        UITabBar.appearance().barTintColor = Colors.orange
        
        StartCurrency.dataSource = self
        StartCurrency.delegate = self
        EndCurrency.dataSource = self
        EndCurrency.delegate = self

        CurrencyCell2.hidden = true
        CurrencyCell4.hidden = true
        
        lblStartCurrency.text = defaults.stringForKey("DefaultStartCurrency")
        lblEndCurrency.text = defaults.stringForKey("DefaultEndCurrency")
        tbShippingCost.text = NSString(format: "%.2f", defaults.floatForKey("DefaultShippingCost")) as String
        tbExchangeRateCorrection.text =  NSString(format: "%.2f", defaults.floatForKey("DefaultExchangeRateCorrection")) as String
        tbImportTax.text = NSString(format: "%.2f", defaults.floatForKey("DefaultImportTax")) as String
        tbProfitMargin.text = NSString(format: "%.2f", defaults.floatForKey("DefaultProfitMargin")) as String

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        switch(section){
        case 0: return 4
        case 1: return 1
        case 2: return 2
        case 3: return 1
        case 4: return 3
        default: return 0
        }
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.endEditing(true) // dismiss the keyboard when clicking on another table cell
        if (indexPath.row == 0 && indexPath.section == 0)
        {
            CurrencyCell2.hidden = false
            CurrencyCell4.hidden = true
        }
        else if (indexPath.row == 2 && indexPath.section == 0)
        {
            CurrencyCell2.hidden = true
            CurrencyCell4.hidden = false
        }
        else 
        {
            CurrencyCell2.hidden = true
            CurrencyCell4.hidden = true
        }
        MainTable.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if (indexPath.row == 1 && indexPath.section == 0)
        {
            if (CurrencyCell2.hidden == true) {return 1}
            else {return 176}
        }
        else if (indexPath.row == 3 && indexPath.section == 0)
        {
            if (CurrencyCell4.hidden == true) {return 1}
            else {return 176}
        }
        else {return 44}
    }
    
    @IBAction func tbShippingCostOnChange(sender: UITextField) {
        if (Float(tbShippingCost.text!) < 0)
        {
            tbShippingCost.text = "0"
        }
        else if (Float(tbShippingCost.text!) > 100)
        {
            tbShippingCost.text = "100"
        }
        
        print(tbShippingCost.text)
        defaults.setFloat(Float(tbShippingCost.text!.stringByReplacingOccurrencesOfString(",", withString: "."))!, forKey: "DefaultShippingCost")

    }
    
    @IBAction func tbExchangeRateCorrectionOnChange(sender: UITextField) {
        if (Float(tbExchangeRateCorrection.text!) < 0)
        {
            tbExchangeRateCorrection.text = "0"
        }
        else if (Float(tbExchangeRateCorrection.text!) > 100)
        {
            tbExchangeRateCorrection.text = "100"
        }
        
        print(tbExchangeRateCorrection.text)
        defaults.setFloat(Float(tbExchangeRateCorrection.text!.stringByReplacingOccurrencesOfString(",", withString: "."))!, forKey: "DefaultExchangeRateCorrection")
    }

    @IBAction func tbImportTaxOnChange(sender: UITextField) {
        if (Float(tbImportTax.text!) < 0)
        {
            tbImportTax.text = "0"
        }
        else if (Float(tbImportTax.text!) > 100)
        {
            tbImportTax.text = "100"
        }
        
        print(tbImportTax.text)
        defaults.setFloat(Float(tbImportTax.text!.stringByReplacingOccurrencesOfString(",", withString: "."))!, forKey: "DefaultImportTax")
    }
    
    @IBAction func tbProfitMargin(sender: UITextField) {
        if (Float(tbProfitMargin.text!) < 0)
        {
            tbProfitMargin.text = "0"
        }
        else if (Float(tbImportTax.text!) > 100)
        {
            tbProfitMargin.text = "100"
        }
        
        print(tbProfitMargin.text)
        defaults.setFloat(Float(tbProfitMargin.text!.stringByReplacingOccurrencesOfString(",", withString: "."))!, forKey: "DefaultProfitMargin")
    }
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == StartCurrency){
            lblStartCurrency.text = pickerData[row]
            defaults.setObject(pickerData[row], forKey: "DefaultStartCurrency")
        }
        else if (pickerView == EndCurrency){
            lblEndCurrency.text = pickerData[row]
            defaults.setObject(pickerData[row], forKey: "DefaultEndCurrency")
        }
    }
}
