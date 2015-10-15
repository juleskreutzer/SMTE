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
    
    let pickerData = ["Euro","US Dollar","Pound","Belgian Euro","Australian Dollar"] // PLACEHOLDER CODE
    
    @IBOutlet weak var MainTable: UITableView!
    @IBOutlet weak var CurrencyCell1: UITableViewCell!
    @IBOutlet weak var CurrencyCell2: UITableViewCell!
    @IBOutlet weak var CurrencyCell3: UITableViewCell!
    @IBOutlet weak var CurrencyCell4: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().barTintColor = Colors.orange
        StartCurrency.dataSource = self
        StartCurrency.delegate = self
        EndCurrency.dataSource = self
        EndCurrency.delegate = self

        UITabBar.appearance().barTintColor = Colors.green
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe:"))
        
        leftSwipe.direction = .Right
        view.addGestureRecognizer(leftSwipe)
        CurrencyCell2.hidden = true
        CurrencyCell4.hidden = true
        
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
        case 4: return 2
        default: return 1
        }
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //let indexPath = tableView.indexPathForSelectedRow();
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
        if (Int(tbShippingCost.text!) < 0)
        {
            tbShippingCost.text = "0"
        }
        else if (Int(tbShippingCost.text!) > 100)
        {
            tbShippingCost.text = "100"
        }
    }
    
    func handleSwipe(sender: UISwipeGestureRecognizer)
    {
        if(sender.direction == .Right)
        {
            let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("StartViewController")
            self.navigationController?.pushViewController(newViewController!, animated: true)
        }
        
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
        if (pickerView == StartCurrency){lblStartCurrency.text = pickerData[row]}
        else if (pickerView == EndCurrency){lblEndCurrency.text = pickerData[row]}
    }

}
