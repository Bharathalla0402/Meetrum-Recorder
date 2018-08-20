//
//  AudioUploadViewController.swift
//  Meetrum Recorder
//
//  Created by think360 on 14/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit
import AVFoundation

class AudioUploadViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {

    @IBOutlet var RecordTypeLab: UILabel!
    @IBOutlet var logoImg: UIImageView!
    
    var audioPlayer : AVAudioPlayer!
    var Selecturl = NSURL()
    
    var audioRecorder:AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Selecturl =  audioRecorder.url as NSURL
        
        print(Selecturl)
    }
    
     // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK:  Save Butt Clicked
    @IBAction func SaveButtClicked(_ sender: UIButton)
    {
        if !audioRecorder.isRecording {
            self.audioPlayer = try! AVAudioPlayer(contentsOf: audioRecorder.url)
            self.audioPlayer.prepareToPlay()
            self.audioPlayer.delegate = self
            self.audioPlayer.play()
        }
    }
    
    // MARK:  ContentType Butt Clicked
    @IBAction func ContentTypeButtClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  Tag Butt Clicked
    @IBAction func TagsButtClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  Audio Format Clicked
    @IBAction func AudioformatButtClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  Audio Quality Clicked
    @IBAction func AudioQualityButtClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  Audio Switch Clicked
    @IBAction func AudioSwitchChanged(_ sender: UISwitch)
    {
        
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print(flag)
    }
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?){
        print(error.debugDescription)
    }
    internal func audioPlayerBeginInterruption(_ player: AVAudioPlayer){
        print(player.debugDescription)
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
