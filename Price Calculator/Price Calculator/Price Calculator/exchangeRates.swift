//
//  exchangeRates.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 13-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import Foundation

class exchangeRates {
    /*
    Retrieve the exchange rates from fixer.io
    */
    
    static var defaults = NSUserDefaults.standardUserDefaults()
    
    static func getExchangeRates() -> Bool {
        // Get the URL for the data
        
        let endpointUSD = NSURL(string: "https://api.fixer.io/latest?base=USD");
        let dataUSD : NSData = NSData(contentsOfURL: endpointUSD!)!
        
        let dictUSD : NSDictionary! = (try! NSJSONSerialization.JSONObjectWithData(dataUSD, options: .MutableContainers) as! NSDictionary)
        
        if(dictUSD != nil)
        {
            defaults.setValue(dictUSD.objectForKey("rates"), forKey: "USDrates")

            return true
        }
        else
        {
            return false
        }
    }
}