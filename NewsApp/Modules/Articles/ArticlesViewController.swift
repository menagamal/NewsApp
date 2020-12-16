//
//  ViewController.swift
//  NewsApp
//
//  Created by Mena Gamal on 12/11/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit
import FittedSheets

class ArticlesViewController: BaseViewController ,ArticlesViewProtocol{
    var presenter: ArticlesPresenterProtocol?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var articlesTableView: UITableView!
    
    @IBOutlet weak var btnFav: UIBarButtonItem!
    
    var isFav = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let country = UserDefaultsHandler().getCountry()
        let categories = UserDefaultsHandler().getCategories()
        if country.isEmpty || categories.isEmpty {
            let vc: OnboardingViewController = UIViewController.instanceXib()
            OnboardingConfig().createModule(view: vc, state: .Country)
            let nav = UINavigationController(rootViewController: vc)
            UIApplication.shared.windows.first?.rootViewController = nav
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    
        
        searchBar.delegate = self
        ArticlesConfig().createModule(view: self)
        if isFav {
            presenter?.loadFavourites()
            self.navigationItem.rightBarButtonItem = nil
        } else {
            presenter?.loadDetails()
        }
    }
    
    
    func openSafari(url: URL) {
        UIApplication.shared.open(url)
    }
    
    @IBAction func goToFav(_ sender: UIBarButtonItem) {
        self.presenter?.goToFavourites()
    }
    
}


extension ArticlesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.presenter?.searchArticles(str: searchText)
    }
    
}

