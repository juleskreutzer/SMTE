//
//  ExportWebViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 25-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class ExportWebViewController: UIViewController {
    
    var data = ""
    
    @IBOutlet weak var viewer: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildHTML()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildHTML()
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var nettoPer : Double = 0.0
        var shippingPer : Double = 0.0
        var exchangePer : Double = 0.0
        var importTaxPer : Double = 0.0
        var marginPer : Double = 0.0
        let netto = defaults.doubleForKey("ExportNetto")
        let shipping = defaults.doubleForKey("ExportShipping")
        let exchange = defaults.doubleForKey("ExportCorrection")
        let importTax = defaults.doubleForKey("ExportTax")
        let margin = defaults.doubleForKey("ExportMargin")
        let startWith = defaults.objectForKey("ExportStart") as! String
        let calculateTo = defaults.objectForKey("ExportEnd")as! String
        let result = defaults.doubleForKey("ExportResult")
        
        
        if(defaults.stringForKey("Calctype") == "CUSTOM" || defaults.stringForKey("Calctype") == "DEFAULT")
        {
            nettoPer = defaults.doubleForKey("nettoPrice")
            shippingPer = defaults.doubleForKey("shippingCost")
            exchangePer = defaults.doubleForKey("correction")
            importTaxPer = defaults.doubleForKey("tax")
            marginPer = defaults.doubleForKey("margin")
        }
        else
        {
            showError("We can't export the result for your calculation at this time.")
        }
        
        data = "<!DOCTYPE HTML>" +
        "<html>" +
        "<head> " +
        "<title>Easy Price Calculator Result Export</title> " +
        "<style>" +
        "html, body { width: 100%; text-align: center; }" +
        "table {" +
        "font-size: 10 px;" +
        "margin: 0 auto;" +
        "border: none;" +
        "}" +
        "table td {" +
        "text-align: center;" +
        "}" +
        "table th {" +
        "color: orange;" +
        "text-align: center;" +
        "}" +
        "h6 {" +
        "font-weight: lighter;" +
        "}" +
        "u {" +
        "text-decoration: none;" +
        "color: green;" +
        "}" +
        "</style>" +
        "</head>" +
        "<body>" +
        "<table>" +
        "<tr>" +
        "<th>Netto Price</th>" +
        "</tr>" +
        "<tr>" +
        "<td>\(netto)</td>" +
        "</tr>" +
        "<tr>" +
        "<th>Shipping Cost</th>" +
        "<th> % </th>" +
        "</tr>" +
        "<tr>" +
        "<td>\(shipping)</td>" +
        "<td>\(shippingPer)</td>" +
        "</tr>" +
        "<tr>" +
        "<th>Exchange Rate Correction</th>" +
        "<th> % </th>" +
        "</tr>" +
        "<tr>" +
        "<td>\(exchange)</td>" +
        "<td>\(exchangePer)</td>" +
        "</tr>" +
        "<tr>" +
        "<th>Import Tax</th>" +
        "<th> % <th>" +
        "</tr>" +
        "<tr>" +
        "<td>\(importTax)</td>" +
        "<td>\(importTaxPer)<td>" +
        "</tr>" +
        "<tr>" +
        "<th>Margin</th>" +
        "<th> % </th>" +
        "</tr>" +
        "<tr>" +
        "<td>\(margin)</td>" +
        "<td>\(marginPer)</td>" +
        "</tr>" +
        "</table>" +
        "<table>" +
        "<tr>" +
        "<th>Start Currency</th><th>End Currency</th>" +
        "</tr>" +
        "<tr>" +
        "<td>\(startWith)</td><td>\(calculateTo)</td>" +
        "</tr>" +
        "</table>" +
        "<br><br><br><br><br><br><br><br><br>" +
        "<footer>" +
        "<h6>Page created with <u>Easy Price Calculator</u> for iOS</h6>" +
        "</body>" +
        "</html>"

        
        
        showHTML(data)
    }
    
    func showHTML(data : String)
    {
        // Place the data in the UIWebView element
        viewer.loadHTMLString(data, baseURL: nil)
        viewer.backgroundColor = Colors.white
        viewer.opaque = false
        
    }
    
    func showError(message: String)
    {
        let alert = UIAlertController(title: "Oops..", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        
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
