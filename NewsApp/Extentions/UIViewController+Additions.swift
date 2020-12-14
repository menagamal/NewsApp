import Foundation
import UIKit
extension UIViewController{

    func showError(error:String, btnAction:(()->Void)! = nil){
        let alert = UIAlertController(title: nil, message: error, preferredStyle: .alert)
        let done = UIAlertAction(title: NSLocalizedString("ok", comment: "ok"), style: .default) { (action) in
            if btnAction != nil {
                btnAction()
            }
        }
        alert.addAction(done)
        self.present(alert,animated: true)
    }
}
//extension UIViewController {
//    static var identifier: String {
//        return String(describing: self)
//    }
//    class func instanceXib<T: UIViewController>() -> T {
//        return T(nibName: T.identifier, bundle: nil)
//    }
//    
//    class func childViewController<T: UIViewController>(fromStoryBoard storyBoard: String) -> T{
//        let storyboard = UIStoryboard(name: storyBoard, bundle: Bundle.main)
//        // Instantiate View Controller
//        guard let viewController = storyboard.instantiateViewController(withIdentifier: T.identifier) as? T else {
//            fatalError("Could not dequeue instantiate ViewController with identifier: \(T.identifier)")
//        }
//        return viewController
//    }
// 
//}
