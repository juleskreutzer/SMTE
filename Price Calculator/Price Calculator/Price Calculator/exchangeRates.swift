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
    
    // Load all currencies to use in pickerview
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
    
    // Get the correct currency value for the calculation
    static func getCurrencyValue(currencyBase : String, currencyTo : String) -> Double
    {
        if(currencyBase == currencyTo)
        {
            return 1.0
        }
        let endpoint = NSURL(string: "https://api.fixer.io/latest?base=\(currencyBase)&symbols=\(currencyTo)")
        let data : NSData = NSData(contentsOfURL: endpoint!)!
        let dict : NSDictionary! = (try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! NSDictionary)
        
        if(dict != nil)
        {
            let rates = dict.objectForKey("rates")!
            let value = Double((rates.objectForKey(currencyTo))! as! NSNumber)
            return value
        }
        return 1.0
    }
    
    // Format the result to match the currency locale
    static func formatResult(currency: String, result: Double) -> NSNumberFormatter
    {
        let formatter = NSNumberFormatter()
        let price = result
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
        
        // Switch over all currencies to set the correct locale
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
                formatter.locale = NSLocale(localeIdentifier: "zh_SG")
                break
            case "EUR":
                formatter.locale = NSLocale(localeIdentifier: "nl_NL")
                break
            case "NOK":
                formatter.locale = NSLocale(localeIdentifier: "en_NO")
                break
            case "HUF":
                formatter.locale = NSLocale(localeIdentifier: "en_HU")
                break
            case "NZD":
                formatter.locale = NSLocale(localeIdentifier: "en_NZ")
                break
            case "MYR":
                formatter.locale = NSLocale(localeIdentifier: "ms_MY")
                break
            case "IDR":
                formatter.locale = NSLocale(localeIdentifier: "id_ID")
                break
            case "KRW":
                formatter.locale = NSLocale(localeIdentifier: "ko_KR")
                break
            case "JPY":
                formatter.locale = NSLocale(localeIdentifier: "ja_JP")
                break
            case "INR":
                formatter.locale = NSLocale(localeIdentifier: "en_IN")
                break
            case "PHP":
                formatter.locale = NSLocale(localeIdentifier: "en_PH")
                break
            case "CZK":
                formatter.locale = NSLocale(localeIdentifier: "cs_CZ")
                break
            case "HKD":
                formatter.locale = NSLocale(localeIdentifier: "en_HK")
                break
            case "ZAR":
                formatter.locale = NSLocale(localeIdentifier: "en_ZA")
                break
            case "CAD":
                formatter.locale = NSLocale(localeIdentifier: "en_CA")
                break
            default:
                NSLog("%d not recognized", currency)
        }
        
        formatter.stringFromNumber(price)
        
        
        return formatter
    }
}