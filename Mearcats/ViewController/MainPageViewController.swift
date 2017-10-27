//
//  MainPageViewController.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController {

    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [
            self.enrollViewController(type: "MyPage"),
            self.enrollViewController(type: "Home"),
            self.enrollViewController(type: "Classification")
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        setViewControllers([orderedViewControllers[1]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }

    private func enrollViewController(type: String) -> UIViewController {
        
        switch type {
        case "MyPage":
            
            let destination = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyPageViewController") as! MyPageViewController
            return destination
        case "Home":
            
            let destination = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            return destination
        case "Classification":
            
            let destination = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ClassificationViewController") as! ClassificationViewController
            return destination
        default:
            /// This will never happen.
            let destination = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyPageViewController") as! MyPageViewController
            return destination
        }
        
    }
}

extension MainPageViewController: UIPageViewControllerDataSource {
    
    /// Left swipe.
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    
    /// Right swipe.
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
}

extension MainPageViewController: UIPageViewControllerDelegate {
    
    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        
        if let currentViewController = viewControllers?[0] {
            if let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) {
                setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
            }
        }
    }
    
    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        
        if let currentViewController = viewControllers?[0] {
            if let previousPage = dataSource?.pageViewController(self, viewControllerBefore: currentViewController) {
                setViewControllers([previousPage], direction: .reverse, animated: animated, completion: completion)
            }
        }
    }
}

