//
//  MyPageViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var mailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customization()
    }
    
    func customization() {
        settingButton.imageView?.contentMode = .scaleAspectFit
        mailButton.imageView?.contentMode = .scaleAspectFit
    }
    
}
