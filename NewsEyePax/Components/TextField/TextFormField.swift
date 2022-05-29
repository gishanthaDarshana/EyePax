//
//  TextFormField.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/28/22.
//
import UIKit
import Foundation

@IBDesignable
class FormTextField: UITextField {
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            layer.cornerRadius = rounded ? frame.size.height / 2 : 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var corner: CGFloat = 0 {
        didSet {
            layer.cornerRadius = corner
        }
    }
    
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
