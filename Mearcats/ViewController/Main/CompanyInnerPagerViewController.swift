//
//  CompanyPagerViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class CompanyInnerPagerViewController: ButtonBarPagerTabStripViewController {

    let purpleInspireColor = UIColor(red: 212/255, green: 129/255, blue: 255/255, alpha: 1)
    let grayInspierColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1)
    
    var index: Int?
    
    override func viewDidLoad() {
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = purpleInspireColor
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = purpleInspireColor
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = self?.grayInspierColor
            newCell?.label.textColor = self?.purpleInspireColor
        }
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let index = self.index {
            moveToViewController(at: index)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let food = UIStoryboard(name: "Company", bundle: nil).instantiateViewController(withIdentifier: "FoodViewController") as! FoodViewController
        
        let clothes = UIStoryboard(name: "Company", bundle: nil).instantiateViewController(withIdentifier: "ClothesViewController") as! ClothesViewController
        
        let cosmetics = UIStoryboard(name: "Company", bundle: nil).instantiateViewController(withIdentifier: "CosmeticsViewController") as! CosmeticsViewController
        
        let medicine = UIStoryboard(name: "Company", bundle: nil).instantiateViewController(withIdentifier: "MedicineViewController") as! MedicineViewController
        
        let interior = UIStoryboard(name: "Company", bundle: nil).instantiateViewController(withIdentifier: "InteriorViewController") as! InteriorViewController
        
        return [food, clothes, cosmetics, medicine, interior]
    }

}
