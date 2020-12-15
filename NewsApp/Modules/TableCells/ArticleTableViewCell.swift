//
//  ArticleTableViewCell.swift
//  NewsApp
//
//  Created by Mena Gamal on 12/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImageView: UIImageView!
    
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelSource: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    
    
    func setDetails(article:Articles){
        if let urlStr = article.urlToImage{
            articleImageView.sd_setImage(with: URL(string: urlStr), completed: nil)
        }
        
        if let value = article.publishedAt {
            labelDate.text = value
        } else {
            labelDate.isHidden = true
        }
        
        if let value = article.source?.name {
            labelSource.text = value
        } else {
            labelSource.isHidden = true
        }

        if let value = article.title {
            labelTitle.text = value
        } else {
            labelTitle.isHidden = true
        }
        
        if let value = article.description {
            labelDesc.text = value
        } else {
            labelDesc.isHidden = true
        }
      
    }
    
}
