//
//  ViewController.swift
//  SampleDemo
//
//  Created by Param on 26/04/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var forgotPasswordLbl: UILabel!
    let viewModelObject = viewModel()
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBAction func submitBtnAction(_ sender: Any) {
        
        UserDefaults.standard.set(true, forKey: "status")
              Switcher.updateRootVC()
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
        
//        self.view.endEditing(true)
//        if Reachability.isConnectedToNetwork(){
//            
//            if Validate(email: txtUserName.text ?? "", password: txtPassword.text ?? ""){
//                self.view.showHUD()
//                let dict = ["username":self.txtUserName.text!,"password":self.txtPassword.text!,"ipAddress":"","device":"Mobile","os":"iOS"] as [String : Any]
//                print("dict:\(dict)")
//                self.viewModelObject.senc_dict = dict
//                
//                viewModelObject.signIn{ (code, data, error,data1) in
//                    //  print(code, data, error, data1)
//                    
//                    DispatchQueue.main.async {
//                        self.view.hideHUD()
//                    }
//                    if let _ = data as? NSDictionary {
//                        let response = try? JSONDecoder().decode(SignInModel.self, from:data1)
//                        if response?.result?.token != nil {
//                            Common.showToast(toast: "Login Successful")
//                            Helpers.saveDeviceToken(token: response?.result?.token ?? "")
//                            Helpers.setLoggedIn(object: true, key: "isLogin")
//                            Helpers.saveUserId(userIdKey: response?.result?.userID ?? 0)
//                            let userData = ["name": response?.result?.name ?? "", "email": response?.result?.emailID ?? "","password":self.txtPassword.text ?? "", "mobile": response?.result?.phone ?? "", "isdCode": response?.result?.isdcode ?? "", "userId":response?.result?.userID ?? 0] as [String : Any]
//                            Helpers.saveUserData(data: userData)
//                            // self.popToProfile()
//                        }
//                        else if response?.data.error != nil {
//                            Common.showToast(toast: response?.data.error?.errorMessage ?? "")
//                        }
//                    }
//                }
//            }
//        }else {
//            Common.showToast(toast: "Please check your internet connection.")
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
//        let text =  "Forgot Password?"
//        forgotPasswordLbl.text = text
//        let attributedString = NSMutableAttributedString(string: text)
//        let underlineStyle = NSUnderlineStyle.single.rawValue // Adjust for desired style (e.g., .double)
//        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: underlineStyle, range: NSRange(location: 0, length:text.count ))
        
        
        forgotPasswordLbl.attributedText = NSAttributedString(string: "ForgotPassword", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
      
        
        // Do any additional setup after loading the view.
    }
}

extension ViewController {
    func Validate(email: String, password: String) -> Bool{
        if(email.isEmpty)
        {
            Common.showToast(toast: "Please enter Email")
            return false
        } else if !(email.isValidEmail()) {
            Common.showToast(toast: "Please enter Valid Email")
            return false
        } else if(password.isEmpty)
        {
            Common.showToast(toast: "Please enter Password")
            return false
        }
       
        return true
    }
}

