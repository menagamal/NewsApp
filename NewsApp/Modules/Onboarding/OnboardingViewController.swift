//
//  OnboardingViewController.swift
//  NewsApp
//
//  Created Mena Gamal on 12/14/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class OnboardingViewController: BaseViewController, OnboardingViewProtocol {
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var topicsCollections: UICollectionView!
     
    var presenter: OnboardingPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.loadDetails()
    }
    
    
    func loadCountriesLayout() {
        self.labelTitle.text = "Choose your country"
    }
    
    func loadCategoriesLayout() {
        self.labelTitle.text = "Choose your categories"
    
    }
}
