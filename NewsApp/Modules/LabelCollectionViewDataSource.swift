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
    
    var selectedArray = [String]()
    var selectedString = ""
    
    var state:OnboardingState?
    override init() {
        super.init()
    }
    
    init(collection:UICollectionView,models:[CountryModel],delegate:LabelCollectionViewDataSourceActions,state:OnboardingState) {
        super.init()
        
        self.collection = collection
        
        self.state = state
        
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
        guard let state = self.state else { return UICollectionViewCell() }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelCollectionViewCell",for: indexPath) as? LabelCollectionViewCell
        let item = models[indexPath.row]
        
        switch state {
        case .Categories:
            if selectedArray.contains(item.title) {
                cell?.setDetails(title: models[indexPath.row].title, state: .Selected)
            } else {
                cell?.setDetails(title: models[indexPath.row].title, state: .Unselected)
            }
            
            break
        case .Country:
            if selectedArray.contains(item.id) {
                cell?.setDetails(title: models[indexPath.row].title, state: .Selected)
            } else {
                cell?.setDetails(title: models[indexPath.row].title, state: .Unselected)
            }
            
            break
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let state = self.state else { return }
        let item = models[indexPath.row]
        switch state {
        case .Categories:
            if selectedArray.contains(item.title) {
                for (i,id) in selectedArray.enumerated() {
                    if id == item.title {
                        selectedArray.remove(at: i)
                    }
                }
            } else {
                self.selectedArray.append(item.title)
            }
            
            break
        case .Country:
           if selectedArray.contains(item.id) {
                for (i,id) in selectedArray.enumerated() {
                    if id == item.id {
                        selectedArray.remove(at: i)
                    }
                }
            } else {
                self.selectedArray.append(item.id)
            }
            
            break
        }
        
        
        self.delegate.didSelect(model: item)
        collectionView.reloadData()
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
