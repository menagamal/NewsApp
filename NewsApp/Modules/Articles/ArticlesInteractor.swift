//
//  ArticlesInteractor.swift
//  NewsApp
//
//  Created Mena Gamal on 12/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import Moya
import DataCache
import Network

class ArticlesInteractor: BaseInteractor<AppTarget>,ArticlesInteractorInputProtocol {
    
    weak var presenter: ArticlesInteractorOutputProtocol?
    
    var requestProvider = MoyaProvider<AppTarget>(callbackQueue: DispatchQueue.global(qos: .utility))
    
    private var articles = [Articles]()
    
    private var searchedArticles = [Articles]()
    
    func loadArticles() {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { [unowned self ]path in
            if path.status == .satisfied {
                self.fetchArticles()
            } else {
                self.articles = self.loadFromCache()
                self.presenter?.didFetchArticles()
            }
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
    
    
    func searchArticles(str: String) {
        self.searchedArticles.removeAll()
        if str.isEmpty {
            self.searchedArticles = articles
        } else {
            for item  in articles {
                if let title = item.title{
                    if title.contains(str) {
                        self.searchedArticles.append(item)
                    }
                }
            }
            
        }
        self.presenter?.didSearchArticles()
    }
    
    func getArticles() -> [Articles] {
        return self.articles
    }
    func getSearched() -> [Articles]  {
        return sortArticlesByDates(articles: self.searchedArticles)
    }
    func toggleFavourite(article: Articles) {
        var fav =  DataCache.instance.readArray(forKey: AppTargetConstant.Keys.favCache) as? [Articles] ?? [Articles]()
        var found = false
        for (i,item) in fav.enumerated() {
            if item.title == article.title {
                found = true
                fav.remove(at: i)
            }
        }
        if !found {
            fav.append(article)
        }
        
        DataCache.instance.write(array: fav, forKey: AppTargetConstant.Keys.favCache)
    }
    
}

extension ArticlesInteractor {
    private func fetchArticles(){
        requestProvider.request(.articles) { [weak self] result in
            guard let self = self else {return }
            switch(result) {
            case .success(let response):
                DispatchQueue.main.async {
                    do {
                        if response.statusCode == BaseConstant.Codes.success.rawValue {
                            let responseModel: ArticlesResponse = try response.map(ArticlesResponse.self)
                            if let presenter = self.presenter , let articles = responseModel.articles {
                                
                                self.articles = self.sortArticlesByDates(articles: articles)
                                self.cacheData()
                                presenter.didFetchArticles()
                            } else {
                                self.presenter?.didFailFetchArticles()
                            }
                            
                            
                        } else {
                            self.presenter?.didFailFetchArticles()
                        }
                    } catch{
                        self.presenter?.didFailFetchArticles()
                    }
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.presenter?.didFailFetchArticles()
                }
            }
            
        }
        
        
    }
    private func sortArticlesByDates(articles:[Articles]) -> [Articles]{
        return articles.sorted(by: { $0.publishedAtDate > $1.publishedAtDate })
    }
    
    private func cacheData(){
        DataCache.instance.write(array: self.articles, forKey: AppTargetConstant.Keys.articlesCache)
    }
    
    private func loadFromCache() -> [Articles]{
        return  DataCache.instance.readArray(forKey: AppTargetConstant.Keys.articlesCache) as? [Articles] ?? [Articles]()
    }
    
}
