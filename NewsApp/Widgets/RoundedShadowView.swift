//
//  RoundedShadowView.swift
//  Dokkanz
//
//  Created by Mena Gamal on 3/13/18.
//  Copyright © 2018 Mena Gamal. All rights reserved.
//


import Foundation
import UIKit

class RoundedShadowView: RoundedEdgeView {
    
    override func didMoveToWindow() {
        
        self.layer.shadowColor = UIColor.link.withAlphaComponent(0.6).cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 2
        // sets the path for the shadow to save ondraw time
        //        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        // cache the shadow so it isn't redrawn
        //        self.layer.shouldRasterize = true
        
        super.didMoveToWindow()
    }
}

