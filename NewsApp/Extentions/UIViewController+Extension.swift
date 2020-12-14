//
//  UIViewController+Extension.swift
//  LabOnClick
//
//  Created by Mustafa Ezzat on 7/9/19.
//  Copyright © 2019 Waqood. All rights reserved.
//
import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    class func instanceXib<T: UIViewController>() -> T {
        return T(nibName: T.identifier, bundle: nil)
    }
    
    class func childViewController<T: UIViewController>(fromStoryBoard storyBoard: String) -> T{
        let storyboard = UIStoryboard(name: storyBoard, bundle: Bundle.main)
        // Instantiate View Controller
        guard let viewController = storyboard.instantiateViewController(withIdentifier: T.identifier) as? T else {
            fatalError("Could not dequeue instantiate ViewController with identifier: \(T.identifier)")
        }
        return viewController
    }
    func updateStatusBarColor() {
        navigationController?.navigationBar.barTintColor =  UIColor.mainColor
        navigationController?.navigationBar.backgroundColor =  UIColor.mainColor/*tintcolor*/
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor:  UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        
        if #available(iOS 13.0, *), let statusBarView = UIApplication.shared.statusBarView {
            statusBarView.backgroundColor = UIColor.mainColor
        }
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .automatic
        }
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        } else {
            self.navigationController?.navigationBar.topItem?.title = ""
        }
    }
    func updateTitle(title: String) {
        self.title = title
    }
    func leftItems() {
    }
  
    func rightItems() {
      
    }
 
    func titleView() {
        guard let image = UIImage(named: "avatar")?.withRenderingMode(.alwaysOriginal) else {return}
        let imageView = UIImageView(image:image)

        let bannerWidth = navigationItem.accessibilityFrame.size.width
        let bannerHeight = bannerWidth

        let bannerX = bannerWidth / 2 - image.size.width / 2
        let bannerY = bannerHeight / 2 - image.size.height / 2

        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit

        navigationItem.titleView = imageView
    }

    @objc func back(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
}
