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
    
    static func getCurrencyValue(currencyBase : String, currencyTo : String) -> Double
    {
        let endpoint = NSURL(string: "https://api.fixer.io/latest?base=\(currencyBase)&symbols=\(currencyTo)")
        let data : NSData = NSData(contentsOfURL: endpoint!)!
        let dict : NSDictionary! = (try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! NSDictionary)
        
        if(dict != nil)
        {
            var rates = dict.objectForKey("rates")
            var value : Double = Double((rates?.objectForKey(currencyTo))! as! NSNumber)
            return value
        }
        return 0
    }
    
    static func formatResult(currency: String, result: Double) -> NSNumberFormatter
    {
        var formatter = NSNumberFormatter()
        var price = result
        
        
        
        switch(currency)
        {
            case "USD":
                formatter.locale = NSLocale(localeIdentifier: "en_US")
                break
            case "THB":
                formatter.locale = NSLocale(localeIdentifier: "th_TH")
                break
            case "PLN":
                formatter.locale = NSLocale(localeIdentifier: "pl_PL")
                break
            case "CNY":
                formatter.locale = NSLocale(localeIdentifier: "zh_CN")
                break
            case "BGN":
                formatter.locale = NSLocale(localeIdentifier: "bg_BG")
                break
            case "SEK":
                formatter.locale = NSLocale(localeIdentifier: "sv_SE")
                break
            case "TRY":
                formatter.locale = NSLocale(localeIdentifier: "en_TR")
                break
            case "ILS":
                formatter.locale = NSLocale(localeIdentifier: "he_IL")
                break
            case "BRL":
                formatter.locale = NSLocale(localeIdentifier: "pt_BR")
                break
            case "RUB":
                formatter.locale = NSLocale(localeIdentifier: "en_RU")
                break
            case "GBP":
                formatter.locale = NSLocale(localeIdentifier: "eb_GB")
                break
            case "DKK":
                formatter.locale = NSLocale(localeIdentifier: "da_DK")
                break
            case "MXN":
                formatter.locale = NSLocale(localeIdentifier: "es_MX")
                break
            case "CHF":
                formatter.locale = NSLocale(localeIdentifier: "fr_CH")
                break
            case "AUD":
                formatter.locale = NSLocale(localeIdentifier: "en_AU")
                break
            case "HRK":
                formatter.locale = NSLocale(localeIdentifier: "hr_HR")
                break
            case "RON":
                formatter.locale = NSLocale(localeIdentifier: "ro_RO")
                break
            case "SGD":
                formatter.locale = NSLocale(localeIdentifier: "")
                break
            case "EUR":
                formatter.locale = NSLocale(localeIdentifier: "")
                break
            case "NOK":
                formatter.locale = NSLocale(localeIdentifier: "")
                break
            case "HUF":
                formatter.locale = NSLocale(localeIdentifier: "")
                break
            case "NZD":
                formatter.locale = NSLocale(localeIdentifier: "")
                break
            case "MYR":
                formatter.locale = NSLocale(localeIdentifier: "")
                break
            case "IDR":
                formatter.locale = NSLocale(localeIdentifier: "")
                break
            case "KRW":
                formatter.locale = NSLocale(localeIdentifier: "")
                break
            case "JPY":
                formatter.locale = NSLocale(localeIdentifier: "")
                break
            case "INR":
                formatter.locale = NSLocale(localeIdentifier: "")
                break
            case "PHP":
                formatter.locale = NSLocale(localeIdentifier: "")
                break
            case "CZK":
                formatter.locale = NSLocale(localeIdentifier: "")
                break
            case "HKD":
                formatter.locale = NSLocale(localeIdentifier: "")
                break
            case "ZAR":
                formatter.locale = NSLocale(localeIdentifier: "")
                break
            case "CAD":
                formatter.locale = NSLocale(localeIdentifier: "")
                break
            default:
                NSLog("%d not recognized", currency)
        }
        
        formatter.stringFromNumber(price)
        
        
        return formatter
    }
}