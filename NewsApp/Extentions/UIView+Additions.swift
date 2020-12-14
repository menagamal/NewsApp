import UIKit
@IBDesignable
extension UIView{
    
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    // Set our computed property type to a closure
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    // This is the meat of the sauce, here we create the tap gesture recognizer and
    // store the closure the user passed to us in the associated object we declared above
    public func addTapGestureRecognizer(action: (() -> Void)?) {
        //  self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }
    
    
    
    @IBInspectable var shadowColor: UIColor {
        get{
            return .clear
        }
        set{
            layer.shadowColor = newValue.cgColor
        }
        
    }
    
    @IBInspectable var shadowOpacity: Float{
        get{
            return 0.0
        }
        set{
            layer.shadowOpacity = newValue
        }
        
    }
    
    @IBInspectable var shadowOffset: CGSize{
        get{
            return .zero
        }
        set{
            layer.shadowOffset = newValue
        }
        
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get{
            return 0.0
        }
        set{
            layer.shadowRadius = newValue
        }
        
    }
}
