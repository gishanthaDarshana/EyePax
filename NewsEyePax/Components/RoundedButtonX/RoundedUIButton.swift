//
//  RoundedUIButton.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/28/22.
//
import UIKit
import Foundation
@IBDesignable class RoundedUIButton: UIButton
{
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }
    
    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [UIColor(named: "GradientOne")!.cgColor, UIColor(named: "GradientTwo")!.cgColor]
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        l.cornerRadius = rounded ? frame.size.height / 2 : 0
        layer.insertSublayer(l, at: 0)
        return l
    }()

    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }

    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
        gradientLayer.frame = bounds
    }
}
