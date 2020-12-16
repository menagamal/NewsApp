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
    @IBOutlet weak var btnFav: UIButton!
    var isFav = false
    var action: (()->Void)?
    func setDetails(article:Articles,action:@escaping(()->Void)){
        if let urlStr = article.urlToImage{
            articleImageView.sd_setImage(with: URL(string: urlStr), completed: nil)
        }
        
        if let _ = article.publishedAt {
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MMM dd,yyyy"
            
            
            labelDate.text = dateFormatterPrint.string(from: article.publishedAtDate)
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
        
        if let value = article.desc {
            labelDesc.text = value
        } else {
            labelDesc.isHidden = true
        }
        btnFav.setImage(UIImage(named: "heart"), for: .normal)
        for item in AppTargetConstant.Favourites {
            if item.title == article.title {
                btnFav.setImage(UIImage(named: "heart-2"), for: .normal)
                isFav = true
            }
        }
        self.action = action
        
    }
    @IBAction func favAction(_ sender: Any) {
        action?()
        if isFav {
            btnFav.setImage(UIImage(named: "heart"), for: .normal)
        } else {
            btnFav.setImage(UIImage(named: "heart-2"), for: .normal)
        }
    }
    
}
