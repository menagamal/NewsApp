//
//  LabelCollectionViewDataSource.swift
//  NewsApp
//
//  Created by Mena Gamal on 12/14/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit
import collection_view_layouts
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
        
        let layout: BaseLayout = TagsLayout()

        layout.delegate = self
        layout.cellsPadding = ItemsPadding(horizontal: 10, vertical: 10)
        layout.cellsPadding = ItemsPadding(horizontal: 8, vertical: 8)

        self.collection.collectionViewLayout = layout
        self.collection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelCollectionViewCell",for: indexPath) as! LabelCollectionViewCell
        cell.setDetails(title: models[indexPath.row].title, state: .Selected)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = models[indexPath.row]
        self.delegate.didSelect(model: item)
    }
    
}
extension LabelCollectionViewDataSource:LayoutDelegate{
    func cellSize(indexPath: IndexPath) -> CGSize {
        let width = Double(self.collection.bounds.width)
        var size = UIFont.systemFont(ofSize: 17).sizeOfString(string: self.models[indexPath.row].title, constrainedToWidth: width)
        size.width += 50
        size.height += 50
        return size
    }
    
    
}


protocol LabelCollectionViewDataSourceActions {
    func didSelect(model:CountryModel)
}
