//
//  MyPageViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit
import AlamofireImage
import RealmSwift
import ObjectMapper
import AlamofireObjectMapper

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var mailButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    let manager = HTTPManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getMyInfo()
    }
    
    func customization() {
        settingButton.imageView?.contentMode = .scaleAspectFit
        mailButton.imageView?.contentMode = .scaleAspectFit
    }
    
    func getMyInfo() {
        let realm = try! Realm()
        
        guard let token = realm.objects(TokenResult.self).first else { return }
        
        spinner.startAnimating()
        
        manager.getMember(with: token.token) { result in
            switch result {
            case .success(let value):
                
                print(Mapper().toJSON(value))
                
                self.spinner.stopAnimating()
                
                if let user = value.member?.first,
                   let url = URL(string: user.img) {
                    
                    print("Set image.")
                    self.profileImage.af_setImage(withURL: url)
                }
                
            case .failure(let error):
                
                self.spinner.stopAnimating()
                print(error)
            }
        }
        
    }
    
}
