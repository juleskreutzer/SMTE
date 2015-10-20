//
//  ResultViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 11-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UINavigationBarDelegate {

    var defaults = NSUserDefaults.standardUserDefaults()
    var formatter = NSFormatter()
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.tintColor = Colors.green
        
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 64))
        
        navigationBar.barTintColor = Colors.green
        
        navigationBar.delegate = self;
        navigationBar.tintColor = Colors.white
        
        
        let navigationItem = UINavigationItem()
        navigationItem.title = "Result"
        
        let leftItem = UIBarButtonItem(title: "Restart", style: .Plain, target: self, action: Selector("RestartAction"))
        
        let rightItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: Selector("ShareAction"))
        
        
        
        navigationItem.leftBarButtonItem = leftItem
        navigationItem.rightBarButtonItem = rightItem
        
        navigationBar.items = [navigationItem]
        
        self.view.addSubview(navigationBar)
        
        
        print(defaults.objectForKey("exchangeEUR"))
        print(defaults.objectForKey("exchangeUSD"))
        
        Calculate()
        
        

        // Do any additional setup after loading the view.
    }
    
    func RestartAction()
    {
        showError("Not implemented Yet.")
        
    }
    
    func ShareAction()
    {
        showError("Share function not implemented here yet.")
        
    }
    
    func Calculate()
    {
        if(defaults.boolForKey("customCal") == true)
        {
            // Calculation with custom values
            print("Custom vars")
            if(defaults.boolForKey("isNettoPrice") == true)
            {
                // Calculate with netto price
                let netto = defaults.doubleForKey("nettoPrice")
                let shippingCost = defaults.doubleForKey("shippingCost")
                let exchangeCorrection = defaults.doubleForKey("correction")
                let importTax = defaults.doubleForKey("tax")
                let desiredMargin = defaults.doubleForKey("margin")
                
                let shipping = round(netto*(shippingCost/100)*100)/100
                let correction = round((netto+shipping)*(exchangeCorrection/100)*100)/100
                let tax = round((netto*(importTax/100))*100)/100
                
                let landedCostWrong = netto + shipping + correction + tax
                
                let toCurrency : Double = exchangeRates.getCurrencyValue(defaults.objectForKey("startWith") as! String, currencyTo: defaults.objectForKey("calculateTo") as! String)
                if(toCurrency != 0)
                {
                    print("currency rate is not 0")
                    let landedCostRight = round((landedCostWrong*toCurrency)*100)/100
                    let result = round(landedCostRight*(desiredMargin/100)*100)/100
                    let formattedResult = exchangeRates.formatResult(defaults.objectForKey("calculateTo") as! String, result: result)
                    resultLabel.text = formattedResult.stringFromNumber(result)
                    resultLabel.tintColor = Colors.green
                }
                else
                {
                    print("currency rate is 0")
                    let result = round(landedCostWrong*(desiredMargin/100)*100)/100
                    let formattedResult = exchangeRates.formatResult(defaults.objectForKey("calculateTo") as! String, result: result)
                    resultLabel.text = formattedResult.stringFromNumber(result)
                    resultLabel.tintColor = Colors.green
                }
                
                
                
            }
            else
            {
                let bruto = defaults.doubleForKey("brutoPrice")
                let discount = defaults.doubleForKey("discountPercentage")
                
                var netto : Double = 0
                if(discount == 0)
                {
                    netto = bruto
                }
                else
                {
                    netto = round(bruto*(discount/100)*100)/100
                }
                
                let shippingCost = defaults.doubleForKey("shippingCost")
                let exchangeCorrection = defaults.doubleForKey("correction")
                let importTax = defaults.doubleForKey("tax")
                let desiredMargin = defaults.doubleForKey("margin")
                
                let shipping = round(netto*(shippingCost/100)*100)/100
                print("Shipping: \(shipping)")
                let correction = round((netto+shipping)*(exchangeCorrection/100)*100)/100
                print("Correction: \(correction)")
                let tax = round((netto*(importTax/100))*100)/100
                print("tax: \(tax)")
                
                let landedCostWrong = netto + shipping + correction + tax
                
                let toCurrency : Double = exchangeRates.getCurrencyValue(defaults.objectForKey("startWith") as! String, currencyTo: defaults.objectForKey("calculateTo") as! String)
                if(toCurrency != 0)
                {
                    print("currency rate is not 0")
                    let landedCostRight = round((landedCostWrong*toCurrency)*100)/100
                    let result = round(landedCostRight*(desiredMargin/100)*100)/100
                    let formattedResult = exchangeRates.formatResult(defaults.objectForKey("calculateTo") as! String, result: result)
                    resultLabel.text = formattedResult.stringFromNumber(result)
                    resultLabel.tintColor = Colors.green
                }
                else
                {
                    print("currency rate is 0")
                    let result = round(landedCostWrong*(desiredMargin/100)*100)/100
                    let formattedResult = exchangeRates.formatResult(defaults.objectForKey("calculateTo") as! String, result: result)
                    resultLabel.text = formattedResult.stringFromNumber(result)
                    resultLabel.tintColor = Colors.green
                }

            }
        }
        else
        {
            // Calculation with default values
            
            if(defaults.boolForKey("isNettoPrice") == true)
            {
                // Calculate from netto price
                let netto = defaults.doubleForKey("nettoPrice")
                let shippingCost = defaults.doubleForKey("DefaultShippingCost")
                let exchangeCorrection = defaults.doubleForKey("DefaultExchangeRateCorrection")
                let importTax = defaults.doubleForKey("DefaultImportTax")
                let desiredMargin = defaults.doubleForKey("DefaultProfitMargin")
                
                let shipping = round(netto*(shippingCost/100)*100)/100
                let correction = round((netto+shipping)*(exchangeCorrection/100)*100)/100
                let tax = round((netto*(importTax/100))*100)/100
                
                let landedCostWrong = netto + shipping + correction + tax
                
                let toCurrency : Double = exchangeRates.getCurrencyValue(defaults.objectForKey("DefaultStartCurrency") as! String, currencyTo: defaults.objectForKey("DefaultEndCurrency") as! String)
                if(toCurrency != 0)
                {
                    print("currency rate is not 0")
                    let landedCostRight = round((landedCostWrong*toCurrency)*100)/100
                    let result = round(landedCostRight*(desiredMargin/100)*100)/100
                    let formattedResult = exchangeRates.formatResult(defaults.objectForKey("calculateTo") as! String, result: result)
                    resultLabel.text = formattedResult.stringFromNumber(result)
                    resultLabel.tintColor = Colors.green
                }
                else
                {
                    print("currency rate is 0")
                    let result = round(landedCostWrong*(desiredMargin/100)*100)/100
                    let formattedResult = exchangeRates.formatResult(defaults.objectForKey("calculateTo") as! String, result: result)
                    resultLabel.text = formattedResult.stringFromNumber(result)
                    resultLabel.tintColor = Colors.green
                }
                
            }
            else
            {
                // Calculate with bruto price
                
                let bruto = defaults.doubleForKey("brutoPrice")
                let discount = defaults.doubleForKey("discountPercentage")
                
                var netto : Double = 0
                if(discount == 0)
                {
                    netto = bruto
                }
                else
                {
                    netto = round(bruto*(discount/100)*100)/100
                }

                let shippingCost = defaults.doubleForKey("DefaultShippingCost")
                let exchangeCorrection = defaults.doubleForKey("DefaultExchangeRateCorrection")
                let importTax = defaults.doubleForKey("DefaultImportTax")
                let desiredMargin = defaults.doubleForKey("DefaultProfitMargin")
                
                let shipping = round(netto*(shippingCost/100)*100)/100
                let correction = round((netto+shipping)*(exchangeCorrection/100)*100)/100
                let tax = round((netto*(importTax/100))*100)/100
                
                let landedCostWrong = netto + shipping + correction + tax
                
                let toCurrency : Double = exchangeRates.getCurrencyValue(defaults.objectForKey("DefaultStartCurrency") as! String, currencyTo: defaults.objectForKey("DefaultEndCurrency") as! String)
                if(toCurrency != 0)
                {
                    print("currency rate is not 0")
                    let landedCostRight = round((landedCostWrong*toCurrency)*100)/100
                    let result = round(landedCostRight*(desiredMargin/100)*100)/100
                    let formattedResult = exchangeRates.formatResult(defaults.objectForKey("calculateTo") as! String, result: result)
                    resultLabel.text = formattedResult.stringFromNumber(result)
                    resultLabel.tintColor = Colors.green
                }
                else
                {
                    print("currency rate is 0")
                    let result = round(landedCostWrong*(desiredMargin/100)*100)/100
                    let formattedResult = exchangeRates.formatResult(defaults.objectForKey("calculateTo") as! String, result: result)
                    resultLabel.text = formattedResult.stringFromNumber(result)
                    resultLabel.tintColor = Colors.green
                }
            }
        }
    }
    
    func showError(message: String)
    {
        let alert = UIAlertController(title: "Oops..", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
