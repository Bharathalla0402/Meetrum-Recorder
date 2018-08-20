//
//  VideoPlayViewController.swift
//  Meetrum Recorder
//
//  Created by think360 on 17/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit
import AVFoundation
import MobileCoreServices
import AVKit

class VideoPlayViewController: UIViewController {
    
    @IBOutlet var logoImg: UIImageView!
    @IBOutlet var TypeRecordLab: UILabel!
    
    @IBOutlet var topView: UIView!
    @IBOutlet var PlayagainButt: UIButton!
    @IBOutlet var RecordButt: UIButton!
    @IBOutlet var QualityLab: UILabel!
    @IBOutlet var myView: UIView!
    @IBOutlet var durationTxt: UILabel!
    
    var player = AVPlayer()
    var videourl = NSURL()
    var videourls = [NSURL]()
    var PlayCheck = String()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        PlayCheck = "1"
        RecordButt.setImage(UIImage(named: "Pause"), for: .normal)
        
        RecordButt.layer.cornerRadius = RecordButt.bounds.size.width/2
        RecordButt.clipsToBounds = true
        
        perform(#selector(self.showPlayerView), with: nil, afterDelay: 1.0)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        
    }
    
   
    @objc func showPlayerView() {
        let playerItem = AVPlayerItem(url: videourl as URL)
        self.player = AVPlayer(playerItem: playerItem)
        let playerLayer = AVPlayerLayer(player: self.player)
        playerLayer.frame=CGRect(x: 0, y: 0, width: self.myView.bounds.size.width, height: self.myView.bounds.size.height)
        self.myView.layer.addSublayer(playerLayer)
        self.player.play()
    }
    
    //MARK: Record Butt Clicked
    @IBAction func playStopAction(_ sender: Any)
    {
        if  PlayCheck == "1"
        {
            self.player.pause()
            RecordButt.setImage(UIImage(named: "PlayAgain"), for: .normal)
            PlayCheck = "2"
        }
        else
        {
            self.player.play()
            RecordButt.setImage(UIImage(named: "Pause"), for: .normal)
            PlayCheck = "1"
        }
    }
    
    
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        let alert = UIAlertController(title: "Meetrum Recorder", message: "Are You Sure Want to Discard the Recording Video.", preferredStyle: UIAlertControllerStyle.alert)
        
        let alertOKAction=UIAlertAction(title:"Discard", style: UIAlertActionStyle.default,handler: { action in
            
            self.navigationController?.popToRootViewController(animated: true)
            
        })
        
        let alertCancelAction=UIAlertAction(title:"Continue", style: UIAlertActionStyle.destructive,handler: { action in
            
        })
        
        alert.addAction(alertOKAction)
        alert.addAction(alertCancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func SaveButtClicked(_ sender: UIButton)
    {
        let playvc = self.storyboard?.instantiateViewController(withIdentifier: "VideoUploadViewController") as? VideoUploadViewController
        playvc?.videourl = videourl
        self.navigationController?.pushViewController(playvc!, animated: true)
    }
    
    @IBAction func PlayAgain(_ sender: UIButton)
    {
        let playerItem = AVPlayerItem(url: videourl as URL)
        self.player = AVPlayer(playerItem: playerItem)
        let playerLayer = AVPlayerLayer(player: self.player)
        playerLayer.frame=CGRect(x: 0, y: 0, width: self.myView.bounds.size.width, height: self.myView.bounds.size.height)
        self.myView.layer.addSublayer(playerLayer)
        self.player.play()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
