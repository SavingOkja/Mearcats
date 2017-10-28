//
//  HomeViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1),
                                      execute: {
            self.addBreathing()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        addBreathing()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        searchButton.transform = CGAffineTransform.identity
    }
    
    func addBreathing() {
        
        UIView.animate(withDuration: 1.25,
                       delay: 0,
                       options: [.repeat, .autoreverse],
                       animations:
        {
            self.searchButton.transform = self.searchButton.transform.scaledBy(x: 1.2, y: 1.2)
        }) { finish in }

    }

    @IBAction func qrAction(_ sender: UIButton) {
        
        let alert = UIAlertController(
            title: "Select!",
            message: "message",
            preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera",
                                   style: .default)
        { action in
            let camera = UIStoryboard(name: "QR", bundle: nil).instantiateViewController(withIdentifier: "QRViewController") as! QRViewController
            self.present(camera, animated: true, completion: nil)
        }
        
        let textAction = UIAlertAction(title: "Text",
                                   style: .default)
        { action in
            let text = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TextSearchViewController") as! TextSearchViewController
            self.present(text, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "cancel",
                                         style: .cancel,
                                         handler: nil)
        
        alert.view.tintColor = UIColor(red: 212/255, green: 129/255, blue: 255/255, alpha: 1)
        alert.addAction(cameraAction)
        alert.addAction(textAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}
