//
//  BasketViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class BasketViewController: UIViewController,
                            IndicatorInfoProvider,
                            UICollectionViewDelegate,
                            UICollectionViewDataSource {
    
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        orderButton.imageView?.contentMode = .scaleAspectFit
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "Basket"
    }
    
    /// UICollectionView Delegate Methods.
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BasketCollectionViewCell", for: indexPath) as! BasketCollectionViewCell
        return cell
    }
}

class BasketCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = imageView.bounds.width/2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
    }
}
