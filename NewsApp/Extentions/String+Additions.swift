//import UIKit
//extension String {
//    func removingWhitespaces() -> String {
//        return components(separatedBy: .whitespaces).joined()
//    }
//  var html2AttributedString: NSAttributedString? {
//       return Data(utf8).html2AttributedString
//   }
//   var html2String: String {
//       return html2AttributedString?.string ?? ""
//   }
//}
//extension Data {
//    var html2AttributedString: NSAttributedString? {
//        do {
//            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
//        } catch {
//            print("error:", error)
//            return  nil
//        }
//    }
//    var html2String: String {
//        return html2AttributedString?.string ?? ""
//    }
//}
//
//
