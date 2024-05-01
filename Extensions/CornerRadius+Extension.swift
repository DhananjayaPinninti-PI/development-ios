//
//  CornerRadius+Extension.swift
//  Onboarding
//
// Created by Param on 29/04/24.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
