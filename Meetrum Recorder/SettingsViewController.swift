//
//  SettingsViewController.swift
//  Meetrum Recorder
//
//  Created by think360 on 14/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var BackButt: UIButton!
    @IBOutlet var LogoImg: UIImageView!
    
    @IBOutlet var AudioFormatLab: UILabel!
    @IBOutlet var AudioQuantityLab: UILabel!
    @IBOutlet var VideoFormatLab: UILabel!
    @IBOutlet var VideoQuantityLab: UILabel!
    @IBOutlet var RecordSwitch: UISwitch!
    @IBOutlet var UploadSwitch: UISwitch!
    
    @IBOutlet var UserNameView: UIView!
    @IBOutlet var UserNameLab: UILabel!
    @IBOutlet var DeleteAccountButt: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserNameView.layer.cornerRadius = 4.0
        UserNameView.layer.borderWidth = 1.3
        UserNameView.layer.borderColor = #colorLiteral(red: 0.2470588235, green: 0.2431372549, blue: 0.2666666667, alpha: 1)
        
        DeleteAccountButt.layer.cornerRadius = 4.0
        DeleteAccountButt.layer.borderWidth = 1.3
        DeleteAccountButt.layer.borderColor = #colorLiteral(red: 0.2470588235, green: 0.2431372549, blue: 0.2666666667, alpha: 1)

        // Do any additional setup after loading the view.
    }

     //MARK: Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
     //MARK: AudioFormat Butt Clicked
    @IBAction func AudioFormatButtClicked(_ sender: UIButton)
    {
        
    }
    
    //MARK: AudioQuality Butt Clicked
    @IBAction func AudioQualityButtClicked(_ sender: UIButton)
    {
        
    }
    
    //MARK: VideoFormat Butt Clicked
    @IBAction func VideoFormatButtClicked(_ sender: UIButton)
    {
        
    }
    
    //MARK: VideoQuality Butt Clicked
    @IBAction func VideoQualityButtClicked(_ sender: UIButton)
    {
        
    }
    
    //MARK: RecordSwitch Butt Clicked
    @IBAction func RecordSwitchChanged(_ sender: UISwitch)
    {
        
    }
    
     //MARK: UploadMeetrum Butt Clicked
    @IBAction func UploadMeetrumSwitchChanged(_ sender: UISwitch)
    {
        
    }
    
     //MARK: Delete Butt Clicked
    @IBAction func DeleteButtClicked(_ sender: UIButton)
    {
        
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
