//
//  GeneralViewController.swift
//  Practicum 2
//
//  Created by Jules Kreutzer on 10-09-15.
//  Copyright (c) 2015 Jules Kreutzer. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class GeneralViewController: UIViewController {
    
    var player: AVAudioPlayer!
 
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
        let audioFilePath = NSBundle.mainBundle().pathForResource("applause-2", ofType: "mp3")
        
        if audioFilePath != nil {
            
            let audioFileUrl = NSURL.fileURLWithPath(audioFilePath!)
            do{
                
            
            player = try AVAudioPlayer(contentsOfURL: audioFileUrl, fileTypeHint: nil)
            player.play()
            } catch
            {
                print(error)
            }
            
        } else {
            print("audio file is not found")
        }
    }
}
