//
//  LabelCollectionViewCell.swift
//  NewsApp
//
//  Created by Mena Gamal on 12/14/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var contanierView: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    
    func setDetails(title:String,state:LabelCollectionViewCellStates) {
        
        self.labelTitle.text = title
        contanierView.cornerRadius = contanierView.frame.height / 3.5
        
        switch state {
        case .Selected:
            contanierView.borderWidth = 1
            contanierView.borderColor = UIColor(hexString: "#FFA200")
            contanierView.backgroundColor = UIColor(hexString: "#FFA200")
            labelTitle.textColor = .white
            
            break
        case .Unselected:
            contanierView.borderWidth = 1
            contanierView.borderColor = .lightGray
            contanierView.backgroundColor = .clear
            labelTitle.textColor = .lightGray
            
            break
        }
    }

}

enum LabelCollectionViewCellStates {
    case  Selected , Unselected
}
