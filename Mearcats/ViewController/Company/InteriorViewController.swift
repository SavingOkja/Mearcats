//
//  InteriorViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class InteriorViewController: UIViewController, IndicatorInfoProvider, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    
    let manager: HTTPManager = HTTPManager.shared
    var companies: [TinyCompany] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        getCompanies()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "Interior"
    }
    
    func getCompanies() {
        
        manager.getCompanies { result in
            switch result {
            case .success(let value):
                
                self.companies =  value.companies.filter {
                    $0.id % 3 == 0
                    }.sorted { $0.id > $1.id }
                self.collectionView.reloadData()
            case .failure(let error):
                
                print(error)
            }
        }
    }
    
    /// UICollectionView Delegate Methods.
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let destination = UIStoryboard(name: "Company", bundle: nil).instantiateViewController(withIdentifier: "CompanyDetailViewController") as! CompanyDetailViewController
        present(destination, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = companies[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCollectionViewCell", for: indexPath) as! FavoriteCollectionViewCell
        
        if let last = item.name.split(separator: " ").last, last == "farm" {
            cell.imageView.image = UIImage(named: "Geumseong")
        } else {
            cell.imageView.image = UIImage(named: "mblogthumb3PhinfNaver")
        }
        
        cell.companyLabel.text = item.name
        return cell
    }
    
}
