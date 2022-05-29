//
//  HTTPErrorHandler.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import Foundation
import UIKit
struct HTTPErrorHandler {
    
    static let shared = HTTPErrorHandler()
    let topView = UIApplication.topViewController()
    
    func handle(errorCode:Int) {
                
        switch errorCode {
        case HTTPErrorCode.NO_INTERNET_ERROR.rawValue:
            NewsSnackBar.make(in: topView?.view ?? UIView(), message: HTTPErrorMsg.NO_INTERNET_ERROR.rawValue, duration: .lengthLong).show()
            
        case HTTPErrorCode.RESPONSE_ERROR.rawValue:
            NewsSnackBar.make(in: topView?.view ?? UIView(), message: HTTPErrorMsg.CONNECTION_ERROR.rawValue, duration: .lengthLong).show()
            
        case HTTPErrorCode.TIME_OUT_ERROR.rawValue:
            NewsSnackBar.make(in: topView?.view ?? UIView(), message: HTTPErrorMsg.TIME_OUT_ERROR.rawValue, duration: .lengthLong).show()
            
        case HTTPErrorCode.JSON_ERROR.rawValue:
            NewsSnackBar.make(in: topView?.view ?? UIView(), message: HTTPErrorMsg.JSON_ERROR.rawValue, duration: .lengthLong).show()
           
        default:
            NewsSnackBar.make(in: topView?.view ?? UIView(), message: HTTPErrorMsg.CONNECTION_ERROR.rawValue, duration: .lengthLong).show()
            
        }
        
    }
}
