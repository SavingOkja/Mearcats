//
//  TextSearchViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit

class TextSearchViewController: UIViewController,
                                UITableViewDelegate,
                                UITableViewDataSource {

    @IBOutlet weak var emptyView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func dismissAction(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    /// UITableView Delegate Methods.
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 103
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextSearchTableViewCell", for: indexPath) as! TextSearchTableViewCell
        cell.companyImageView.image = UIImage(named: "mblogthumb3PhinfNaver")
        return cell
    }
}

class TextSearchTableViewCell: UITableViewCell {
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        companyImageView.image = nil
    }
}
