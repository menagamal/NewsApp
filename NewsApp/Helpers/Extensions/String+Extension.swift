//import UIKit
//extension String {
//    func removingWhitespaces() -> String {
//        return components(separatedBy: .whitespaces).joined()
//    }
//    var html2AttributedString: NSAttributedString? {
//        return Data(utf8).html2AttributedString
//    }
//    var html2String: String {
//        return html2AttributedString?.string ?? ""
//    }
//    func stringToDate()->Date {
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US")
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Your date format
//        let date1 = dateFormatter.date(from: String(self)) //according to date format your date string
//        return date1 ?? Date()
//    }
//    func stringToDateWithFormat(format:String)->Date {
//        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = format //Your date format
//        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        
//        let date1 = dateFormatter.date(from: String(self)) //according to date format your date string
//        return date1 ?? Date()
//    }
//    func localized() -> String {
//        return NSLocalizedString(self, comment: self)
//    }
//}
