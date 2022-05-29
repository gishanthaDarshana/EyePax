//
//  CategoryView.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import Foundation
import UIKit
@IBDesignable class CategoryView: View {
    
    @IBInspectable override var rounded : Bool {
        didSet {
            layer.cornerRadius = rounded ? frame.size.height / 2.5 : 0
        }
    }

}

