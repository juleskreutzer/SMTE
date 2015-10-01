//
//  TableViewController.swift
//  Practicum 3
//
//  Created by Jules Kreutzer on 01-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var pirates = [Pirate]()
    
    
    
    func loadJsonData()
    {
        // NSAppTransportSecurity and NSAllowsArbitraryLoads need to be added to info.plist because Swift 2 doesn't accept request to a server over HTTP protocol
        
        // http://www.atimi.com/simple-json-parsing-swift-2/
        
        var url = NSURL(string: "http://athena.fhict.nl/users/i886625/pirates.json")
        var request = NSURLRequest(URL: url!)
        var session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            do{
                if let jsonObject : AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                {
                    self.parseJsonData(jsonObject)
                }
            }
            catch
            {
                print("Error parsing JSON data")
            }
            
        }
        dataTask.resume()
        
    }
    
    func  parseJsonData(jsonObject: AnyObject)
    {
        if let jsonData = jsonObject as? NSArray
        {
            for item in jsonData
            {
                let newPirate = Pirate(name: item.objectForKey("name") as! String, life: item.objectForKey("life") as! String, yearsActive: item.objectForKey("years_active") as! String, countryOrigin: item.objectForKey("country_of_origin") as! String, comments: item.objectForKey("comments") as! String)
                pirates.append(newPirate);
            }
        }
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadJsonData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pirates.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let currRow = indexPath.row
        let currPirate = self.pirates[currRow]
        cell.textLabel?.text = currPirate.name
        
        return cell
    }
    
    
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var selectedRow = self.tableView.indexPathForSelectedRow!
        var selectedPirate = self.pirates[selectedRow.row]
        
        var controller = segue.destinationViewController as! DetailsViewController
        controller.selectedPirate = selectedPirate
        
    }


}
