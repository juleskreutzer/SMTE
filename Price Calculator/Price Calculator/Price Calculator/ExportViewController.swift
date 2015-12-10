//
//  ExportViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 24-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class ExportViewController: UIViewController {

    @IBOutlet weak var exportWeb: UIButton!
    @IBOutlet weak var exportExcel: UIButton!
    @IBOutlet weak var exportPdf: UIButton!
    @IBOutlet weak var exportMail: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Button setup
        exportWeb.layer.cornerRadius = 10
        exportWeb.layer.borderWidth = 2
        exportWeb.layer.borderColor = Colors.orange.CGColor
        exportWeb.tintColor = Colors.orange
        
        exportExcel.layer.cornerRadius = 10
        exportExcel.layer.borderWidth = 2
        exportExcel.layer.borderColor = Colors.orange.CGColor
        exportExcel.tintColor = Colors.orange
        
        exportPdf.layer.cornerRadius = 10
        exportPdf.layer.borderWidth = 2
        exportPdf.layer.borderColor = Colors.orange.CGColor
        exportPdf.tintColor = Colors.orange
        
        exportMail.layer.cornerRadius = 10
        exportMail.layer.borderWidth = 2
        exportMail.layer.borderColor = Colors.orange.CGColor
        exportMail.tintColor = Colors.orange

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ExportResultToMail(sender: AnyObject) {
        showError("This function is not implemented yet. Please choose the \" Web \" option.")
    }
    
    @IBAction func ExportResultToPdf(sender: AnyObject) {
        showError("This function is not implemented yet. Please choose the \" Web \" option.")
    }
    
    @IBAction func ExportResultToExcel(sender: AnyObject) {
        showError("This function is not implemented yet. Please choose the \" Web \" option.")
    }
    
    @IBAction func ExportResultToWeb(sender: AnyObject) {
        let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ExportWebViewController")
        self.navigationController?.pushViewController(newViewController!, animated: true)
    }
    
    func showError(message : String)
    {
        
        let alert = UIAlertController(title: "Oops..", message: message, preferredStyle: .Alert)
        
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
