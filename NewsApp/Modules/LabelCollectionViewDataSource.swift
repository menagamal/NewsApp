//
//  LabelCollectionViewDataSource.swift
//  NewsApp
//
//  Created by Mena Gamal on 12/14/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import Foundation
import UIKit
class LabelCollectionViewDataSource:NSObject, UICollectionViewDataSource, UICollectionViewDelegate  {
      
    var models: [CountryModel] = [CountryModel]()
    var collection:UICollectionView!
    var delegate:LabelCollectionViewDataSourceActions!
    
    override init() {
        super.init()
    }
    
    init(collection:UICollectionView,models:[CountryModel],delegate:LabelCollectionViewDataSourceActions) {
        super.init()
        
        self.collection = collection
        
        self.models = models
        
        self.collection.register(UINib(nibName: "LabelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LabelCollectionViewCell")
        
        
        self.collection.dataSource = self
        
        self.collection.delegate = self
        
        self.delegate = delegate
        
        self.collection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelCollectionViewCell",for: indexPath) as! LabelCollectionViewCell
        cell.setDetails(title: models[indexPath.row].id, state: .Selected)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = models[indexPath.row]
        self.delegate.didSelect(model: item)
    }
    
}



protocol LabelCollectionViewDataSourceActions {
    func didSelect(model:CountryModel)
}
