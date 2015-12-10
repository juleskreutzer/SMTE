//
//  ProViewController.swift
//  Price Calculator
//
//  Created by Jules Kreutzer on 18-10-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import UIKit
import StoreKit

class ProViewController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {

    @IBOutlet weak var RestorePurchaseButton: UIBarButtonItem!
    @IBOutlet weak var buyButton: UIButton!
    
    var product_id: NSString?;

    var defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        
        product_id = "EasyPriceCalculatorPro"
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        RestorePurchaseButton.tintColor = Colors.white
        navigationController?.navigationBar.barTintColor = Colors.green

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Call the buy method
    @IBAction func GoPro(sender: AnyObject) {
        buyConsumable()
    }
    
    @IBAction func RestorePurchases(sender: AnyObject) {
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        SKPaymentQueue.defaultQueue().restoreCompletedTransactions()
    }
    
    func buyConsumable(){
        print("About to fetch the products");
        // We check that we are allow to make the purchase.
        if (SKPaymentQueue.canMakePayments())
        {
            let productID:NSSet = NSSet(object: self.product_id!);
            let productsRequest:SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>);
            productsRequest.delegate = self;
            productsRequest.start();
            print("Fething Products");
        }else{
            print("can't make purchases");
        }
    }
    
    // Helper Methods
    
    func buyProduct(product: SKProduct){
        print("Sending the Payment Request to Apple");
        let payment = SKPayment(product: product)
        SKPaymentQueue.defaultQueue().addPayment(payment);
        
    }
    
    
    // Delegate Methods for IAP
    
    func productsRequest (request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
        print("got the request from Apple")
        let count : Int = response.products.count
        if (count>0) {
            let validProducts = response.products
            let validProduct: SKProduct = response.products[0] as SKProduct
            if (validProduct.productIdentifier == self.product_id) {
                print(validProduct.localizedTitle)
                print(validProduct.localizedDescription)
                print(validProduct.price)
                buyProduct(validProduct);
            } else {
                print(validProduct.productIdentifier)
            }
        } else {
            print("nothing")
        }
    }
    
    
    func request(request: SKRequest, didFailWithError error: NSError) {
        print("La vaina fallo");
    }
    
    func paymentQueue(queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        // It seems that IAP is turned off in simulator, that's why the IAP will always fail when debugging/testing
        // http://stackoverflow.com/questions/26983439/skpaymenttransaction-always-fail
        
        print("Received Payment Transaction Response from Apple");
        
        for transaction:AnyObject in transactions {
            if let trans:SKPaymentTransaction = transaction as? SKPaymentTransaction{
                switch trans.transactionState {
                case .Purchased:
                    print("Product Purchased");
                    defaults.setBool(true, forKey: "ProVersion")
                    exchangeRates.getExchangeRates()
                    
                    let alert = UIAlertController(title: "Thank You", message: "You now own Easy Price Calculator Pro. All currencies should be available by now. If not, please restart this app.", preferredStyle: .Alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alert.addAction(defaultAction)
                    
                    presentViewController(alert, animated: true, completion: nil)
                    SKPaymentQueue.defaultQueue().finishTransaction(transaction as! SKPaymentTransaction)
                    break;
                case .Failed:
                    print("Purchased Failed");
                    let alert = UIAlertController(title: "Oops..", message: "Something went wrong. We weren't able to finish the transaction. Please try to buy Easy Price Calculator Pro again. If the problem still exists, please contact Apple.", preferredStyle: .Alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alert.addAction(defaultAction)
                    
                    presentViewController(alert, animated: true, completion: nil)
                    SKPaymentQueue.defaultQueue().finishTransaction(transaction as! SKPaymentTransaction)
                    break;
                    // case .Restored:
                    //[self restoreTransaction:transaction];
                default:
                    print("Transaction is not failed or purchased, something weird happend")
                    break;
                }
            }
        }
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
