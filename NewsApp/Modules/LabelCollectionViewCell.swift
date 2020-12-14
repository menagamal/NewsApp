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
        
    }

}

enum LabelCollectionViewCellStates {
    case  Selected , Unselected
}
