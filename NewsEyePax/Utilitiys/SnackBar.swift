//
//  ComonValidations.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/28/22.
//

import Foundation
import SnackBar_swift
class NewsSnackBar: SnackBar {
    override var style: SnackBarStyle {
        var style = SnackBarStyle()
        style.background = UIColor(named: "PrimaryColor")!
        style.textColor = UIColor.white
        return style
    }
}
