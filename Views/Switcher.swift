//
//  Switcher.swift
//  SampleDemo
//
//  Created by Param on 30/04/24.
//

import Foundation
import UIKit

class Switcher {
    
    static func updateRootVC(){

        let status = UserDefaults.standard.bool(forKey: "status")
        var rootVC : UIViewController?
        if(status == true){
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        }else{
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        
    }
    
}
