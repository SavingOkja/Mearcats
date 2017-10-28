//
//  UIViewExtension.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var iBorderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    @IBInspectable var iBorderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var iCornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
}
