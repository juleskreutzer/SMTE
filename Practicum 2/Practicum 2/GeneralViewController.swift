//
//  GeneralViewController.swift
//  Practicum 2
//
//  Created by Jules Kreutzer on 10-09-15.
//  Copyright (c) 2015 Jules Kreutzer. All rights reserved.
//

import UIKit
import AVFoundation

class GeneralViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    @IBAction func btnPlaySound(sender: AnyObject) {
        let mp3_one_path = NSBundle.mainBundle().pathForResource("applause-2", ofType: "mp3")
        var player = AVPlayer(URL: NSURL(fileURLWithPath: mp3_one_path!))
        player.play()
    }
}
