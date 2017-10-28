//
//  ViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift
import Realm

class LoginViewController: UIViewController {

    @IBOutlet weak var meerkatsView: UIStackView!
    @IBOutlet weak var signView: UIStackView!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var fbButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    let manager = HTTPManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.imageView?.contentMode = .scaleAspectFit
        signInButton.imageView?.contentMode = .scaleAspectFit
        fbButton.imageView?.contentMode = .scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let realm = try! Realm()
        
        sleep(UInt32(1))
        
        UIView.animate(withDuration: 1, animations: {
            
            self.meerkatsView.center.y = self.meerkatsView.center.y - 60
        }) { isCompleted in
            guard isCompleted == true else { return }
            
            self.signView.isHidden = false
            self.orLabel.isHidden = false
            self.fbButton.isHidden = false
            
            if realm.objects(TokenResult.self).first != nil {

                let destination = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
                
                self.present(destination, animated: true, completion: nil)
                
                return
            }
        }
    }
    
    func login(with fbtoken: String, imageURL: String) {
        
        manager.login(with: fbtoken,
                      imageURL: imageURL)
        { result in
            
            switch result {
            case .success(let value):
                
                let realm = try! Realm()
                
                try! realm.write {
                    print("write success")
                    realm.add(value)
                }
                
                 let destination = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
                 
                 self.present(destination, animated: true, completion: nil)
 
                
            case .failure(let error):
                
                print(error)
            }
        }
        
    }
    
    @IBAction func facebookLoginAction(_ sender: UIButton) {
        
        let loginManager = LoginManager()
        
        loginManager.logIn(readPermissions: [.email, .publicProfile],
                           viewController: self)
                           { result in
                            
                            switch result {
                            case .success(_, _, let accessToken):
                                guard let userId = accessToken.userId else { return }
                                
                                self.login(
                                    with: accessToken.authenticationToken,
                                   imageURL: "http://graph.facebook.com/\(userId)/picture?type=large"
                                )
                                
                            case .failed(let error):
                                
                                print(error)
                            case .cancelled: break
                            }
        }
    }
    
}

