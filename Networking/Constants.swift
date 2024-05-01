

import Foundation
import UIKit

let AlertTitle = "name"
let APPDELEGATE: AppDelegate = UIApplication.shared.delegate as! AppDelegate

let borderGray = UIColor(named: "borderGray")
//let baseURL = "https://qapmmobileapi.pisupport.center/api" // QA
let baseURL = "https://mobileapi.properties.market/api" // Production
struct Constants {
    struct API {
//        static let baseURL = "https://qapmmobileapi.pisupport.center/api/" // QA
        static let baseURL = "https://mobileapi.properties.market/api/" // Production
        
    }
    struct Texts {
        static let errorParsingResponse = "Unknown Error"
    }
}


