//
//  LatestNewsCell.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import UIKit

class LatestNewsCell: UICollectionViewCell {

    @IBOutlet weak var partOfTheNews: UILabel!
    @IBOutlet weak var newsImage: RoundedImageView!
    @IBOutlet weak var auther: UILabel!
    @IBOutlet weak var headLineNme: UILabel!
    
    let  gradientLayer   = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        gradientLayer.frame  =  self.newsImage.bounds
        gradientLayer.colors = [UIColor.clear.cgColor,UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.25)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.25)
        self.newsImage.layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

}
