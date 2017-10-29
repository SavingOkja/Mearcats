//
//  MyPageInnerPagerViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MyPageInnerPagerViewController: ButtonBarPagerTabStripViewController {

    let purpleInspireColor = UIColor(red: 212/255, green: 129/255, blue: 255/255, alpha: 1)
    let grayInspierColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1)
    
    override func viewDidLoad() {
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = purpleInspireColor
        settings.style.buttonBarBackgroundColor = grayInspierColor
        
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 18)
        settings.style.buttonBarHeight = 50
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
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let favorite = UIStoryboard(name: "MyInfo", bundle: nil).instantiateViewController(withIdentifier: "FavoriteViewController") as! FavoriteViewController
        
        let history = UIStoryboard(name: "MyInfo", bundle: nil).instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        
        return [favorite, history]
    }
}
