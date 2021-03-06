//
//  VideoRecordingViewController.swift
//  Meetrum Recorder
//
//  Created by think360 on 16/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit
import AVFoundation
import MobileCoreServices
import AVKit

class VideoRecordingViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
   
    
    @IBOutlet var SettingsButt: UIButton!
    @IBOutlet var logoImg: UIImageView!
    @IBOutlet var TypeRecordLab: UILabel!
    @IBOutlet var AVSwitch: UISwitch!
    @IBOutlet var RecordButt: UIButton!
    @IBOutlet var QualityLab: UILabel!
    @IBOutlet var myView: UIView!
    @IBOutlet var durationTxt: UILabel!
    
    let captureSession = AVCaptureSession()
    let movieOutput = AVCaptureMovieFileOutput()
    var previewLayer: AVCaptureVideoPreviewLayer!
    var activeInput: AVCaptureDeviceInput!
    
    var outputURL: URL!
    let avPlayer = AVPlayer()
    var avPlayerLayer: AVPlayerLayer!
    var url = NSURL()
    var seconds: Int!
    var durationTimer: Timer?
    
    var player = AVPlayer()
    var Selecturl = NSURL()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        durationTxt.isHidden = true

        RecordButt.layer.cornerRadius = RecordButt.bounds.size.width/2
        RecordButt.clipsToBounds = true
        
       
        
         perform(#selector(self.showPlayerView), with: nil, afterDelay: 1.0)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func showPlayerView() {
        if setupSession() {
            setupPreview()
            startSession()
        }
    }
    
    func setupPreview() {
        // Configure previewLayer
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = self.view.bounds
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        myView.layer.addSublayer(previewLayer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    
    
    
    //MARK:- Setup Camera
    
    func setupSession() -> Bool {
        
        captureSession.sessionPreset = AVCaptureSession.Preset.high
        //captureSession.startse
        // Setup Camera
       // let camera = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        let camera = AVCaptureDevice.default(for: .video)
        
        do {
            let input = try AVCaptureDeviceInput(device: camera!)
            if captureSession.canAddInput(input) {
                captureSession.addInput(input)
                activeInput = input
            }
        } catch {
            print("Error setting device video input: \(error)")
            return false
        }
        
        // Setup Microphone
       // let microphone = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeAudio)
         let microphone = AVCaptureDevice.default(for: .audio)
        
        do {
            let micInput = try AVCaptureDeviceInput(device: microphone!)
            if captureSession.canAddInput(micInput) {
                captureSession.addInput(micInput)//addInput(micInput)
            }
        } catch {
            print("Error setting device audio input: \(error)")
            return false
        }
        
        // Movie output
        if captureSession.canAddOutput(movieOutput) {
            captureSession.addOutput(movieOutput)
        }
        
        return true
    }
    
    func setupCaptureMode(_ mode: Int) {
        // Video Mode
        
    }
    
    //MARK:- Camera Session
    func startSession() {
        if !captureSession.isRunning {
            videoQueue().async {
                self.captureSession.startRunning()
            }
        }
    }
    
    func stopSession() {
        if captureSession.isRunning {
            videoQueue().async {
                self.captureSession.stopRunning()
            }
        }
    }
    
    func videoQueue() -> DispatchQueue {
        return DispatchQueue.main
    }
    
    
    
    func currentVideoOrientation() -> AVCaptureVideoOrientation {
        var orientation: AVCaptureVideoOrientation
        
        switch UIDevice.current.orientation {
        case .portrait:
            orientation = AVCaptureVideoOrientation.portrait
        case .landscapeRight:
            orientation = AVCaptureVideoOrientation.landscapeLeft
        case .portraitUpsideDown:
            orientation = AVCaptureVideoOrientation.portraitUpsideDown
        default:
            orientation = AVCaptureVideoOrientation.landscapeRight
        }
        
        return orientation
    }
    
   
    
    //EDIT 1: I FORGOT THIS AT FIRST
    
    func tempURL() -> URL? {
        let directory = NSTemporaryDirectory() as NSString
        
        if directory != "" {
            let path = directory.appendingPathComponent(NSUUID().uuidString + ".mp4")
            return URL(fileURLWithPath: path)
        }
        
        return nil
    }
    
   
    
     //MARK: Record Butt Clicked
    @IBAction func playStopAction(_ sender: Any)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "StartVideoRecordingViewController") as? StartVideoRecordingViewController
        self.navigationController?.pushViewController(myVC!, animated: false)
     
    }
    
    
    
    //MARK: Setting Butt Clicked
    @IBAction func SettingsButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    //MARK: AVSwitch Changed
    @IBAction func AVSwitchChanged(_ sender: UISwitch)
    {
        self.AVSwitch.setOn(true, animated: false)
       self.navigationController?.popToRootViewController(animated: true)
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
