//
//  RoundedTabBar.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/28/22.
//

import Foundation
import UIKit
class RoundedTabBarView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
        
    }
}
