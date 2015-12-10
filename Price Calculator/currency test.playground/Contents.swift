//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print("test")

let endpoint = NSURL(string: "https://api.fixer.io/latest?base=USD&symbols=EUR")
let data : NSData = NSData(contentsOfURL: endpoint!)!
let dict : NSDictionary! = (try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! NSDictionary)

if(dict != nil)
{
    var rates = dict.objectForKey("rates")
    var value : Double = Double((rates?.objectForKey("EUR"))! as! NSNumber)
}

