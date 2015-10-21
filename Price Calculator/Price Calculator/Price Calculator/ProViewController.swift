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

    @IBOutlet weak var NavigationBar: UINavigationBar!
    @IBOutlet weak var RestorePurchaseButton: UIBarButtonItem!
    @IBOutlet weak var buyButton: UIButton!
    
    var productIDs: Array<String!> = []
    var productArray : Array<SKProduct!> = []
    
    var productList = [SKProduct]()
    var p = SKProduct()
    var product_id: String?
    
    var defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        product_id = "EasyPriceCalculatorPro"
        
        NavigationBar.tintColor = Colors.green
        NavigationBar.backgroundColor = Colors.green
        RestorePurchaseButton.tintColor = Colors.white
        
        self.view.reloadInputViews()

        // Do any additional setup after loading the view.
    }
    
    func buyPro(product : SKProduct) {
        print("Sending payment request..")
        var payment = SKPayment(product: product)
        SKPaymentQueue.defaultQueue().addPayment(payment)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Call the buy method
    @IBAction func GoPro(sender: AnyObject) {
        if(SKPaymentQueue.canMakePayments()) {
            print("IAP is enabled, loading..")
            let productID : NSSet = NSSet(object: self.product_id!)
            let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>)
            request.delegate = self
            request.start()
        } else {
            print("please enable IAPS")
        }
        
        for product in productList {
            if(product == "EasyPriceCalculatorPro")
            {
                p = product
                buyPro(p)
                break
            }
        }
    }
    @IBAction func RestorePurchases(sender: AnyObject) {
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        SKPaymentQueue.defaultQueue().restoreCompletedTransactions()
    }
    
    func showError(message: String)
    {
        let alert = UIAlertController(title: "Oops..", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func productsRequest(request: SKProductsRequest!, didReceiveResponse response: SKProductsResponse!) {
        print("product request")
        var count : Int = response.products.count
        if (count>0) {
            var validProducts = response.products
            var validProduct: SKProduct = response.products[0] as SKProduct
            if (validProduct.productIdentifier == self.product_id) {
                print(validProduct.localizedTitle)
                print(validProduct.localizedDescription)
                print(validProduct.price)
                buyPro(validProduct)
            } else {
                print(validProduct.productIdentifier)
            }
        } else {
            print("nothing")
        }
//        var myProduct = response.products
//        
//        for product in myProduct {
//            print("product added")
//            print(product.productIdentifier)
//            print(product.localizedTitle)
//            print(product.localizedDescription)
//            print(product.price)
//            
//            list.append(product as! SKProduct)
//        }
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(queue: SKPaymentQueue) {
        print("transactions restored")
        
        var purchasedItemIDS = []
        for transaction in queue.transactions {
            var t: SKPaymentTransaction = transaction 
            
            let prodID = t.payment.productIdentifier as String
            
            switch prodID {
            case "EasyPriceCalculator":
                defaults.setBool(true, forKey: "ProVersion")
                exchangeRates.getExchangeRates()
            default:
                print("IAP not setup")
            }
            
        }
    }
    
    func paymentQueue(queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("Got response from Apple, process payment please")
        
        for transaction:AnyObject in transactions {
            if let trans:SKPaymentTransaction = transaction as? SKPaymentTransaction{
                switch trans.transactionState {
                case .Purchased:
                    print("Product Purchased");
                    SKPaymentQueue.defaultQueue().finishTransaction(transaction as! SKPaymentTransaction)
                    defaults.setBool(true , forKey: "purchased")
                    exchangeRates.getExchangeRates()
                    break;
                case .Failed:
                    print("Purchased Failed");
                    showError("We didn't get any response from Apple about your payment. If this problem won't solve itself, please contact us.")
                    SKPaymentQueue.defaultQueue().finishTransaction(transaction as! SKPaymentTransaction)
                    break;
                case .Restored:
                    print("Already Purchased");
                    SKPaymentQueue.defaultQueue().restoreCompletedTransactions()
                    exchangeRates.getExchangeRates()
                default:
                    break;
                }
            }
        }
    }
    
    func finishTransaction(trans:SKPaymentTransaction)
    {
        print("finish transansaction")
        SKPaymentQueue.defaultQueue().finishTransaction(trans)
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
