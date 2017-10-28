//
//  ClassificationViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit

class ClassificationViewController: UIViewController,
                                    UICollectionViewDelegate,
                                    UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
    }

    /// UICollectionView Delegate Methods.
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let destination = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CompanyPagerViewController") as! CompanyPagerViewController
        
        destination.index = indexPath.row
        
        let nav = UINavigationController(rootViewController: destination)
        
        present(nav, animated: true, completion: nil)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClassificationCollectionViewCell", for: indexPath) as! ClassificationCollectionViewCell
        
        switch indexPath.row {
        case 0:  cell.imageView.image = UIImage(named: "foodIc")
        case 1:  cell.imageView.image = UIImage(named: "clothesIc")
        case 2:  cell.imageView.image = UIImage(named: "cosmeitcsIc")
        case 3:  cell.imageView.image = UIImage(named: "medicineIc")
        case 4:  cell.imageView.image = UIImage(named: "interiorIc")
        default: cell.imageView.image = UIImage(named: "group2")
        }
        
        return cell
        
    }
}

class ClassificationCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func  prepareForReuse() {
        imageView.image = nil
    }
}
