//
//  UserDefaultsHelper.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/30/22.
//

import Foundation
struct UserDefaultsHelper{
    static let shared = UserDefaultsHelper()
    private let userdefaults = UserDefaults.standard
    private init (){}
    
    func saveLogInflag(save : Bool){
        userdefaults.set(save, forKey: "loginFlag")
        userdefaults.synchronize()
    }
    
    func isLoggedIn()-> Bool{
        let logedIn = userdefaults.bool(forKey: "loginFlag")
        return logedIn
    }
    
    func removeLoginFlag(){
        userdefaults.removeObject(forKey: "loginFlag")
        userdefaults.synchronize()
    }
}
