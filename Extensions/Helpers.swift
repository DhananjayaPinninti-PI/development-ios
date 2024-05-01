

import Foundation
import Alamofire
import Toaster

struct Helpers {

    static func userToken() -> String {
        guard let token = UserDefaults.standard.value(forKey: "Authorization") else {
            return ""
        }
        return token as! String
    }
    static func saveImpressionId(impressionId:String){
        UserDefaults.standard.set(impressionId, forKey: "Impression")
        UserDefaults.standard.synchronize()
    }
    static func getImpressionId() -> String{
        return UserDefaults.standard.value(forKey: "Impression") as? String ?? ""
    }
 
    static func saveUserToken(token:String){
        UserDefaults.standard.set(token, forKey: "Authorization")
        UserDefaults.standard.synchronize()
    }
    static func saveUserId(userIdKey:Int){
        UserDefaults.standard.set(userIdKey, forKey: "userId")
        UserDefaults.standard.synchronize()
    }
    static func getUserId() -> Int{
        return UserDefaults.standard.value(forKey: "userId") as? Int ?? 0
    }
    static func saveUserData(data:JSONDictionary){
        UserDefaults.standard.set(data, forKey: "User")
        UserDefaults.standard.synchronize()
    }
    
    static func getUserData() -> JSONDictionary {
        return UserDefaults.standard.value(forKey: "User") as? JSONDictionary ?? [:]
    }
    
    static func saveDeviceToken(token:String){
        UserDefaults.standard.set(token, forKey: "devicetoken")
        UserDefaults.standard.synchronize()
    }
    
    static func getDeviceToken() -> String {
        return UserDefaults.standard.value(forKey: "devicetoken") as? String ?? ""
    }
    
    static func savePropertyType(property:String){
        UserDefaults.standard.set(property, forKey: "propertyType")
        UserDefaults.standard.synchronize()
    }
    static func getPropertyType() -> String {
        return UserDefaults.standard.value(forKey: "propertyType") as? String ?? ""
    }
    static func removeUserToken() {
        UserDefaults.standard.removeObject(forKey: "Authorization")
        UserDefaults.standard.removeObject(forKey: "User")
    }
    
    static func saveUserOnline(isOnline:Bool){
        UserDefaults.standard.set(isOnline, forKey: "isOnline")
        UserDefaults.standard.synchronize()
    }
    
    static func saveNotificationType(type:String){
        UserDefaults.standard.set(type, forKey: "NotificationType")
        UserDefaults.standard.synchronize()
    }
    
    static func getNotificationType() -> String {
        return UserDefaults.standard.value(forKey: "NotificationType") as? String ?? ""
    }
    
    static func getUserOnline() -> Bool {
        return UserDefaults.standard.value(forKey: "isOnline") as? Bool ?? false
    }
    static func setLoggedIn(object: Any, key: String) {
        UserDefaults.standard.set(object, forKey: key)
         UserDefaults.standard.synchronize()
    }
    static func isLoggedIn(key: String) -> Bool {
        let obj = UserDefaults.standard.object(forKey: key) as? Bool
        return obj ?? false
    }
    
    static func validateResponse(_ statusCode: Int) -> Bool {
        if case 200...300 = statusCode {
            return true
        }
        return false
    }
    static func logOut (){
        UserDefaults.standard.removeObject(forKey: "isLogin")
        UserDefaults.standard.removeObject(forKey: "devicetoken")
        UserDefaults.standard.removeObject(forKey: "User")
    }
    static func saveSearchModelKeys(object: String, key: String) {
        UserDefaults.standard.set(object, forKey: key)
         UserDefaults.standard.synchronize()
    }
    static func getSearchModelKeys(key: String) -> Any {
        let obj = UserDefaults.standard.object(forKey: key)
        return obj as Any
    }
}

//MARK: UIImageView
class RoundImageView: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.width/2

    }
    
}

//MARK: UIButton
class RoundCornerButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true

    }
    
}
struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6_7          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P_7P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
}


class Common: NSObject {
    
    class func setUserDefault(obj: AnyObject!, forKey key: String!) {
        UserDefaults.standard.set(obj as Any, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func getUserDefault(forKey key: String!) -> AnyObject? {
        return  UserDefaults.standard.value(forKey: key) as AnyObject?
    }
    
    
    class func saveDict(dict: NSDictionary, key: String) {
        let data = NSKeyedArchiver.archivedData(withRootObject: dict)
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey:key)
    }
    
    
    class func getDict(key: String) -> NSDictionary? {
        if let data = UserDefaults.standard.object(forKey: key) as? NSData {
            let object = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as! NSDictionary
            return object;
        }
        return nil
    }
    class func addMenuNavigationLeftButtonOn(controller: UIViewController)
    {
        let btnMenu: UIButton! = UIButton(frame: CGRect( x:0, y:0, width:30, height:30));
        btnMenu .setImage(UIImage(named: "menu"), for: UIControl.State.normal);
        btnMenu.addTarget(Common.self, action: #selector(Common.showLeftMenu), for: UIControl.Event.touchUpInside);
        
        let barBtnMenu: UIBarButtonItem! = UIBarButtonItem(customView: btnMenu);
        controller.navigationItem.leftBarButtonItem = barBtnMenu;
        controller.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        controller.navigationController?.navigationBar.barTintColor = UIColor.white
        controller.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
    }
    @objc class func showLeftMenu()
    {
        
        UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil);

       // AppManager.share.revealVC.revealToggle(animated: true)
    }
    
    class func formattedNumber(number: String) -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "(XXX)XXX-XXXX"
        
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        print(result)
        return result
    }
    class func showToast (toast:String) {
        Toast(text: toast).show()
    }

}

