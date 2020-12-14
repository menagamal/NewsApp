import UIKit

public protocol UIVerificationCodeDelegate {
    func verificationCode(_ verificationCode: UIVerificationCode, didFinishWithCode code: String)
    func codeDeleteBackward()
}

open class UIVerificationCode: UIView, UIKeyInput {
    open var delegate: UIVerificationCodeDelegate?
    private var nextTag = 1
    var codeLabelList = [UITextField]()
    
    // MARK: - UIResponder
    open var codeEmptyStype = ""
    open var backGrounded = UIColor.white
    open var errorColor = UIColor.red
    open var textColor = UIColor.black
    open var cornerRounded: CGFloat = 4.0
    open var borderStrock: CGFloat = 2.0
    open var codeWidth: CGFloat = 64.0
    open var codeHeight: CGFloat = 40.0
    open var codeGap: CGFloat = 15.0
    open var maxTag = 4
    public var isSecureTextEntry: Bool = false
    
    open override var canBecomeFirstResponder : Bool {
        return true
    }
    
    // MARK: - UIView
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        // Add six digitLabels
    }
    
    open func setupCode(){
        var frame = CGRect(x: 0, y: 0, width: codeWidth, height: codeHeight)
        for index in 1...maxTag {
            let digitLabel = UITextField(frame: frame)
            digitLabel.isUserInteractionEnabled = false
            digitLabel.textColor = UIColor(hexString: "#3C3C3C")
            digitLabel.font = .systemFont(ofSize: 32)
            digitLabel.tag = index
            digitLabel.text = codeEmptyStype
            digitLabel.cornerRadius = cornerRounded
            let underline = CALayer()
            underline.backgroundColor = UIColor(hexString: "#3C3C3C").cgColor
            underline.frame = CGRect(x: 0, y: 50, width: digitLabel.frame.size.width, height: 1)
            digitLabel.layer.addSublayer(underline)
            digitLabel.backgroundColor = .clear
            digitLabel.isSecureTextEntry = self.isSecureTextEntry
            digitLabel.textAlignment = .center
            digitLabel.borderStyle = .none
            addSubview(digitLabel)
            frame.origin.x += codeWidth + codeGap
            codeLabelList.append(digitLabel)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") } // NSCoding
    
    // MARK: - UIKeyInput
    
    public var hasText : Bool {
        return nextTag > 1 ? true : false
    }
    
    open func insertText(_ text: String) {
        if nextTag < maxTag+1 {
            (viewWithTag(nextTag)! as! UITextField).text = text
            nextTag += 1
            
            if nextTag == maxTag+1 {
                var code = ""
                for index in 1..<nextTag {
                    code += (viewWithTag(index)! as! UITextField).text!
                }
                delegate?.verificationCode(self, didFinishWithCode: code)
            }
        }
    }
    
    open func deleteBackward() {
        delegate?.codeDeleteBackward()
        if nextTag > 1 {
            nextTag -= 1
            (viewWithTag(nextTag)! as! UITextField).text = codeEmptyStype
        }
    }
    
    open func clear() {
        while nextTag > 1 {
            deleteBackward()
        }
    }
    
    // MARK: - UITextInputTraits
    
    open var keyboardType: UIKeyboardType { get { return .asciiCapableNumberPad } set { } }
    
    open func showBorderColor() {
        for label in codeLabelList {
            label.borderColor = errorColor
        }
    }
    
    open func setTextColor() {
        for label in codeLabelList {
            label.textColor = textColor
        }
    }
    
    open func hideBorderColor() {
        for label in codeLabelList {
            label.borderColor = backGrounded
        }
    }
}
@IBDesignable
extension UIView{
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
