//
//  CompanyPagerViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit

class CompanyPagerViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CompanyEmbededSegue" {
            let embeded = segue.destination as! CompanyInnerPagerViewController
            
            if let index = self.index {
                embeded.index = index
            }
        }
    }

    @IBAction func cancelAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
