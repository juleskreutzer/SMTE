//: Playground - noun: a place where people can play

import UIKit

func readData(url: String)
{
    if let url = NSURL(string: url)
    {
        do {
            let html = try NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding)
            print("html: \(html)")
        }
        catch
        {
            print("x")
        }
    }
}

var data = "blablabla%REPLACE%blablabla"

data.stringByReplacingOccurrencesOfString("%REPLACE%", withString: "TEST")

readData("http://google.nl")
