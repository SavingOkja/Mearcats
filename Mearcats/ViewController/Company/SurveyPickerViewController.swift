//
//  SurveyPickerViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 29..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit

class SurveyPickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layer.cornerRadius = 30
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
