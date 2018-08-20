//
//  ViewController.swift
//  Meetrum Recorder
//
//  Created by think360 on 14/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var SettingsButt: UIButton!
    @IBOutlet var logoImg: UIImageView!
    @IBOutlet var TypeRecordLab: UILabel!
    @IBOutlet var AVSwitch: UISwitch!
    @IBOutlet var CenterLogo: UIImageView!
    @IBOutlet var RecordButt: UIButton!
    @IBOutlet var QualityLab: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RecordButt.layer.cornerRadius = RecordButt.bounds.size.width/2
        RecordButt.clipsToBounds = true
        // Do any additional setup after loading the view, typically from a nib.
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
        self.AVSwitch.setOn(false, animated: false)
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "VideoRecordingViewController") as? VideoRecordingViewController
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    @IBAction func SwitchButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "VideoRecordingViewController") as? VideoRecordingViewController
        self.navigationController?.pushViewController(myVC!, animated: false)
    }
    
    //MARK: Record Butt Clicked
    @IBAction func RecordButtClicked(_ sender: UIButton)
    {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "RecordingViewController") as? RecordingViewController
        self.navigationController?.pushViewController(myVC!, animated: true)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

