//
//  FavoriteViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class FavoriteViewController: UIViewController,
                              IndicatorInfoProvider,
                              UICollectionViewDelegate,
                              UICollectionViewDataSource {

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
        return "Favorite"
    }
    
    func getCompanies() {
        
        manager.getCompanies { result in
            switch result {
            case .success(let value):
                
                self.companies =  value.companies.filter { $0.id > 2 }.sorted { $0.id < $1.id }
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = companies[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCollectionViewCell", for: indexPath) as! FavoriteCollectionViewCell
        cell.imageView.image = UIImage(named: "mblogthumb3PhinfNaver")
        cell.companyLabel.text = item.name
        return cell
    }
}

class FavoriteCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
}
