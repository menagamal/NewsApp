//
//  ArticlesTableViewDataSource.swift
//  NewsApp
//
//  Created by Mena Gamal on 12/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

class ArticlesTableViewDataSource:  NSObject, UITableViewDataSource,UITableViewDelegate {
    
    weak var delegate: MyStoresCellDataSourceDelegate!
    
    var tableView: UITableView!
    
    var articles = [Articles]()
    init(delegate:MyStoresCellDataSourceDelegate,tableView:UITableView,articles:[Articles]) {
        super.init()
        
        self.articles = articles
        self.delegate = delegate
        self.tableView = tableView
        self.tableView = tableView
        self.tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.reloadData()
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell
        cell?.selectionStyle = .none
        cell?.setDetails(article: articles[indexPath.row], action: { [weak self] in
            guard let self = self else {return}
            self.delegate.didToggleFav(article: self.articles[indexPath.row])
          
        })
        return cell  ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url  = articles[indexPath.row].url{
            delegate.didSelected(url: url)
        }
    }
}

protocol MyStoresCellDataSourceDelegate: class {
    func didSelected(url:String)
    func didToggleFav(article:Articles)
  
}

