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
                                UITableViewDataSource,
                                UISearchBarDelegate {

    @IBOutlet weak var emptyView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var companies: [TinyCompany] = []
    let manager = HTTPManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        
        searchBar.delegate = self
    
        emptyView.isHidden = false
    }
    
    func getCompanices(with text: String) {
        
        manager.getCompanies { result in
            switch result {
            case .success(let value):
                
                self.companies = value.companies.filter { $0.name.contains(text) }
                
                if self.companies.isEmpty {
                    self.emptyView.isHidden = false
                } else {
                    self.emptyView.isHidden = true
                }
                
                self.tableView.reloadData()
                
                
            case .failure(let error):
                
                print(error)
            }
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        getCompanices(with: searchText)
    }
    
    @IBAction func dismissAction(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    /// UITableView Delegate Methods.
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 103
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = companies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextSearchTableViewCell", for: indexPath) as! TextSearchTableViewCell
        
        cell.companyImageView.image = UIImage(named: "mblogthumb3PhinfNaver")
        cell.companyLabel.text = item.name
        cell.followersLabel.text = ""
        
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
