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
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var articlesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        ArticlesConfig().createModule(view: self)
        presenter?.loadDetails()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func openSafari(url: URL) {
        UIApplication.shared.open(url)
    }
    
    
}


extension ArticlesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.presenter?.searchArticles(str: searchText)
    }

}

