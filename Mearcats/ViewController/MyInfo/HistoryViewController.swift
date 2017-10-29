//
//  HistoryViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class HistoryViewController: UIViewController,
                             IndicatorInfoProvider,
                             UITableViewDelegate,
                             UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let manager: HTTPManager = HTTPManager.shared
    var companies: [TinyCompany] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getCompanies()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "History"
    }
    
    func getCompanies() {
        
        manager.getCompanies { result in
            switch result {
            case .success(let value):
                
                self.companies =  value.companies.filter { $0.id % 3 == 0 }.sorted { $0.id < $1.id }
                self.tableView.reloadData()
            case .failure(let error):
                
                print(error)
            }
        }
    }
    
    /// UITableView Delegate Methods.
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = companies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell") as! HistoryTableViewCell
        
        if let last = item.name.split(separator: " ").last, last == "farm" {
            cell.productImageView.image = UIImage(named: "Geumseong")
        } else {
            cell.productImageView.image = UIImage(named: "mblogthumb3PhinfNaver")
        }
    
        cell.productLabel.text = item.name
        cell.companyLabel.text = ""
        cell.dateLabel.text = "2017.10.28"
        
        return cell
    }
}

class HistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
}
