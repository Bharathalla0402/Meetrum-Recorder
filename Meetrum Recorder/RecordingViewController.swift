//
//  RecordingViewController.swift
//  Meetrum Recorder
//
//  Created by think360 on 14/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit
import AVFoundation
import MobileCoreServices
import AVKit

class MusicCell: UICollectionViewCell
{
    @IBOutlet var TimeLab: UILabel!
}



class RecordingViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, AVAudioPlayerDelegate, AVAudioRecorderDelegate {

    @IBOutlet var MusicCollectionView: UICollectionView!
    @IBOutlet var TimerLab: UILabel!
    @IBOutlet var PlayButt: UIButton!
    
    var timer1 = Timer()
    var timer2 = Timer()
    
    var Cell:MusicCell!
     var x = 0
    var y:Int = 0
    
    var strTimerCheck = String()
    
    var recordingSession : AVAudioSession!
    var audioRecorder    :AVAudioRecorder!
    var settings         = [String : Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlayButt.layer.cornerRadius = PlayButt.bounds.size.width/2
        PlayButt.clipsToBounds = true

        // Do any additional setup after loading the view.
        
        strTimerCheck = "1"
        setTimer()
        
        
        recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        print("Allow")
                    } else {
                        print("Dont Allow")
                    }
                }
            }
        } catch {
            print("failed to record!")
        }
        
        // Audio Settings
        
        settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            audioRecorder = try AVAudioRecorder(url: self.directoryURL()! as URL,
                                                settings: settings)
            audioRecorder.delegate = self
            audioRecorder.prepareToRecord()
        } catch {
            finishRecording(success: false)
        }
        do {
            try audioSession.setActive(true)
            audioRecorder.record()
        } catch {
        }
        
    }
    
    func directoryURL() -> NSURL? {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = urls[0] as NSURL
        let soundURL = documentDirectory.appendingPathComponent("sound.m4a")
        print(soundURL)
        return soundURL as NSURL?
    }
    
    func startRecording() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            audioRecorder = try AVAudioRecorder(url: self.directoryURL()! as URL,
                                                settings: settings)
            audioRecorder.delegate = self
            audioRecorder.prepareToRecord()
        } catch {
            finishRecording(success: false)
        }
        do {
            try audioSession.setActive(true)
            audioRecorder.record()
        } catch {
        }
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        if success {
            print(success)
        } else {
            audioRecorder = nil
            print("Somthing Wrong.")
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    
    
    //MARK:- Setup Camera
    
    // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
     // MARK:  Save Butt Clicked
    @IBAction func SaveButtClicked(_ sender: UIButton)
    {
        x = 0
        y = 0
        PlayButt.setImage(UIImage(named: "Camera"), for: .normal)
        timer1.invalidate()
        timer2.invalidate()
        strTimerCheck = "2"
        self.finishRecording(success: true)
        let hours = self.y / 3600
        let minutes = self.y / 60 % 60
        let seconds = self.y % 60
        TimerLab.text =  String(format:"%02i : %02i : %02i", hours, minutes, seconds)
        
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AudioUploadViewController") as? AudioUploadViewController
        myVC?.audioRecorder = audioRecorder
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    // MARK:  Play Butt Clicked
    @IBAction func PlayButtClicked(_ sender: UIButton)
    {
        if strTimerCheck == "1"
        {
            PlayButt.setImage(UIImage(named: "Camera"), for: .normal)
            timer1.invalidate()
            timer2.invalidate()
            strTimerCheck = "2"
        }
        else
        {
            PlayButt.setImage(UIImage(named: "Play"), for: .normal)
            strTimerCheck = "1"
            setTimer()
            
            
            
            
        }
        
        if audioRecorder == nil {
            self.startRecording()
        } else {
            audioRecorder.pause()
           
        }
        
        
        x = 0
        y = 0
        PlayButt.setImage(UIImage(named: "Camera"), for: .normal)
        timer1.invalidate()
        timer2.invalidate()
        strTimerCheck = "2"
        self.finishRecording(success: true)
        let hours = self.y / 3600
        let minutes = self.y / 60 % 60
        let seconds = self.y % 60
        TimerLab.text =  String(format:"%02i : %02i : %02i", hours, minutes, seconds)
        
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "AudioUploadViewController") as? AudioUploadViewController
        myVC?.audioRecorder = audioRecorder
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    func setTimer()
    {
      timer1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.autoScroll), userInfo: nil, repeats: true)
      timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timercount), userInfo: nil, repeats: true)
    }
    
    @objc func timercount()
    {
        let hours = self.y / 3600
        let minutes = self.y / 60 % 60
        let seconds = self.y % 60
      
        TimerLab.text =  String(format:"%02i : %02i : %02i", hours, minutes, seconds)
        self.y = self.y + 1
    }
    
    
    @objc func autoScroll()
    {
        if self.x < 3600
        {
            let indexPath = IndexPath(item: x, section: 0)
            self.MusicCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.x = self.x + 1
        }
        else {
            self.x = 0
            self.MusicCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    
    // MARK:  Collection View Delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 3600
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        return CGSize(width: 62 , height: 90)
        
    }
    
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCell", for: indexPath) as! MusicCell
        
      //  let hours = indexPath.row / 3600
        let minutes = indexPath.row / 60 % 60
        let seconds = indexPath.row % 60
       
        Cell.TimeLab.text = String(format:"%02i:%02i", minutes, seconds)
        
        return Cell
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
