//
//  OnboardingPresenter.swift
//  NewsApp
//
//  Created Mena Gamal on 12/14/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class OnboardingPresenter: BasePresenter,OnboardingPresenterProtocol {
   

    weak internal var view: OnboardingViewProtocol?
    var interactor: OnboardingInteractorInputProtocol?
    private let router: OnboardingRouterProtocol

    init(view: OnboardingViewProtocol, interactor: OnboardingInteractorInputProtocol?, router: OnboardingRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func loadAllCountries() {
           
       }
       
       func loadAllCategories() {
           
       }
       
}

extension OnboardingPresenter: OnboardingInteractorOutputProtocol {
    
}
