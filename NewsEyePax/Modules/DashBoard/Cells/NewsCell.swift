//
//  NewsCell.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsImage: RoundedImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var auther: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    
    let  gradientLayer   = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
