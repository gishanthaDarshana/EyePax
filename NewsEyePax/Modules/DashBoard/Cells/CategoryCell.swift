//
//  CategoryCell.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var backGround: CategoryView!
    @IBOutlet weak var titleText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        backGround.backgroundColor = nil
    }
    
    func selectedItem(_ selected: Bool) {
        if selected {
            backGround.backgroundColor = UIColor(named: "GradientOne")
        } else {
            backGround.backgroundColor = nil
        }
    }

}
