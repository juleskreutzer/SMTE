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
    
    static func getExchangeRates() {
        // Get the URL for the data
        let endpointEUR = NSURL(string: "https://api.fixer.io/latest?base=EUR")
        let endpointUSD = NSURL(string: "https://api.fixer.io/latest?base=USD");
        let dataEUR : NSData = NSData(contentsOfURL: endpointEUR!)!
        let dataUSD : NSData = NSData(contentsOfURL: endpointUSD!)!
        
        let dictEUR : NSDictionary! = (try! NSJSONSerialization.JSONObjectWithData(dataEUR, options: .MutableContainers) as! NSDictionary)
        let dictUSD : NSDictionary! = (try! NSJSONSerialization.JSONObjectWithData(dataUSD, options: .MutableContainers) as! NSDictionary)
        
        
        defaults.setValue(dictEUR.objectForKey("rates"), forKey: "EURrates")
        defaults.setValue(dictUSD.objectForKey("rates"), forKey: "USDrates")
    }
    
}