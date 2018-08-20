//
//  VideoUploadViewController.swift
//  Meetrum Recorder
//
//  Created by think360 on 16/08/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class VideoUploadViewController: UIViewController {

    @IBOutlet var RecordTypeLab: UILabel!
    @IBOutlet var logoImg: UIImageView!
    @IBOutlet var UploadImg: UIImageView!
    
     var videourl = NSURL()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UploadImg.layer.cornerRadius = UploadImg.bounds.size.width/2
        UploadImg.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    
    // MARK:  Back Butt Clicked
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK:  Save Butt Clicked
    @IBAction func SaveButtClicked(_ sender: UIButton)
    {
        
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
    @IBAction func VideoformatButtClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  Audio Quality Clicked
    @IBAction func VideoQualityButtClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:  Audio Switch Clicked
    @IBAction func VideoSwitchChanged(_ sender: UISwitch)
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
