//
//  StringExtension.swift
//  Kait
//
//  Created by Apple on 01/04/20.
//  Copyright © 2020 Sagar. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    func getDateFromTimeStamp(timeStamp:Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        print(localDate)
        return localDate
    }

    func notificationtype() -> String {
        switch self {
        case "all":
            return "All"
        case "assigned_to_me":
            return "Assigned to me"
        case "none":
            return "none"
        default:
            return ""
        }
    }
    func stringRemoveSpaces() -> String {
        return self.replacingOccurrences(of: " ", with: "%20")
    }
    func base64ToImage() -> UIImage? {
           if let url = URL(string: self),let data = try? Data(contentsOf: url),let image = UIImage(data: data) {
               return image
           }
           return nil
       }
    func currencyFormatting() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.locale = Locale.current
            formatter.numberStyle = .currency
            formatter.maximumFractionDigits = 2
            formatter.minimumFractionDigits = 2
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
}

