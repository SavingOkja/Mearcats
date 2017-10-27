//
//  HomeViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func qrAction(_ sender: UIButton) {
        
        let camera = UIStoryboard(name: "QR", bundle: nil).instantiateViewController(withIdentifier: "QRViewController") as! QRViewController
        present(camera, animated: true, completion: nil)
    }
}
