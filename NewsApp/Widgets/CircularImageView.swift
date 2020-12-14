//
//  CircularImageView.swift
//  Dokkanz
//
//  Created by Mena Gamal on 3/13/18.
//  Copyright © 2018 Mena Gamal. All rights reserved.
//

import UIKit

class CircularImageView: UIImageView {
    
    override func didMoveToWindow() {
        
        let size = frame.size.width
        self.layer.cornerRadius = size / 2
        clipsToBounds = true
        
        super.didMoveToWindow()
    }
}

