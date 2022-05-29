//
//  View.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/28/22.
//

import UIKit

@IBDesignable class View: UIView {
    
    // MARK: Background color
    @IBInspectable public var colorOpacity: CGFloat = 0 {
        didSet {
            backgroundColor = backgroundColor?.withAlphaComponent(colorOpacity)
        }
    }
    
    // MARK: - Corner radius
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            layer.cornerRadius = rounded ? frame.size.height / 2 : 0
        }
    }
    
    
    // MARK: - Border
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    // MARK: - Shadow
    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
    
    @IBInspectable public var shadowOffsetX: CGFloat = 0 {
        didSet {
            layer.shadowOffset.width = shadowOffsetX
        }
    }
    
    // MARK: - Gradient
    
    @IBInspectable var FirstColor : UIColor? {
        didSet{
            updateGradient()
        }
    }
    
    @IBInspectable var SecondColor : UIColor? {
        didSet{
            updateGradient()
        }
    }
    
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    // Update color changes
    private func updateGradient() {
        
        let gradientLayer = self.layer as! CAGradientLayer
        gradientLayer.frame = self.bounds
        
        var colors : [CGColor] = []
        
        if let firstColor = FirstColor?.cgColor {
            colors.append(firstColor)
        }
        if let secondColor = SecondColor?.cgColor {
            colors.append(secondColor)
        }
        
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
    }
    
    
        
}

