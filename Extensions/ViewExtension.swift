//
//  ViewExtension.swift
//  Kait
//
//  Created by Apple on 08/04/20.
//  Copyright © 2020 Sagar. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIView {
    
    internal func showHUD() {
        MBProgressHUD.showAdded(to: self, animated: true)
    }
    
    internal func hideHUD() {
        MBProgressHUD.hide(for: self, animated: true)
    }
    
     static func loadFromXib<T>(withOwner: Any? = nil, options: [UINib.OptionsKey : Any]? = nil) -> T where T: UIView
     {
         let bundle = Bundle(for: self)
         let nib = UINib(nibName: "\(self)", bundle: bundle)

         guard let view = nib.instantiate(withOwner: withOwner, options: options).first as? T else {
             fatalError("Could not load view from nib file.")
         }
         return view
     }
    
}
