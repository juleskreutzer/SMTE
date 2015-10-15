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
    
    static func getExchangeRates() {
        // Get the URL for the data
        let endpointEUR = NSURL(string: "https://api.fixer.io/latest?base=USD&symbols=EUR")
        let data : NSData = NSData(contentsOfURL: endpointEUR!)!
        
        let dict : NSDictionary! = (try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! NSDictionary)
        
        /*
        for(var i = 0; i < (dict.valueForKey("rates") as! NSArray).count; i++)
        {
            
        }
*/
        
        
        
        
    }
    
}