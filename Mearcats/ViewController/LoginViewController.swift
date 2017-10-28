//
//  ViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var meerkatsView: UIStackView!
    @IBOutlet weak var signView: UIStackView!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var fbButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.imageView?.contentMode = .scaleAspectFit
        signInButton.imageView?.contentMode = .scaleAspectFit
        fbButton.imageView?.contentMode = .scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        sleep(UInt32(1))
        
        UIView.animate(withDuration: 1, animations: {
            
            self.meerkatsView.center.y = self.meerkatsView.center.y - 60
        }) { isCompleted in
            guard isCompleted == true else { return }
            
            self.signView.isHidden = false
            self.orLabel.isHidden = false
            self.fbButton.isHidden = false
        }
        
    }
    
    @IBAction func facebookLoginAction(_ sender: UIButton) {
        
        let destination = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
        
        present(destination, animated: true, completion: nil)
    }
    
}

