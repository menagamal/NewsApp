//
//  ViewController.swift
//  NewsApp
//
//  Created by Mena Gamal on 12/11/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class ArticlesViewController: BaseViewController ,ArticlesViewProtocol{
    var presenter: ArticlesPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let vc: OnboardingViewController = UIViewController.instanceXib()
//        OnboardingConfig().createModule(view: vc, state: .Country)
//        //self.present(vc, animated: true, completion: nil)
//        self.show(vc, sender: self)
    }
    
    
}

