//
//  CompanyDetailViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit
import Presentr

class CompanyDetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancelAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func settingAction(_ sender: UIButton) {
        
        let presentr = Presentr(presentationType: .custom(
            width: ModalSize.custom(size: Float(320)),
            height: ModalSize.custom(size: Float(570)),
            center: ModalCenterPosition.custom(
                centerPoint: CGPoint(
                    x: UIScreen.main.bounds.width/2,
                    y: UIScreen.main.bounds.height/2
            ))
            )
        )
        
        let picker = UIStoryboard(name: "Company", bundle: nil).instantiateViewController(withIdentifier: "SurveyPickerViewController") as! SurveyPickerViewController

        self.customPresentViewController(presentr, viewController: picker, animated: true, completion: nil)
    }
}
