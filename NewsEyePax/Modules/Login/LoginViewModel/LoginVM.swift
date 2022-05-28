//
//  LoginVM.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/28/22.
//

import Foundation
class LoginVM {
    weak var loginDelegate : AuthenticateDelegate?
    
    func authenticateUser(userName : String, password : String){
        let validationStatus = validateUser(userName: userName, passWord: password)
        if validationStatus == ""{
            guard let users = DBManager.shared.getUser() else {
                loginDelegate?.onAuthenticationError(error: "User not found!")
                return
            }
            
            let user = users.filter { usr in
                return usr.userName == userName && usr.passWord == password
            }.first
            
            loginDelegate?.onAuthenticateSuccess(success: user == nil ? false : true)
        }else{
            loginDelegate?.onAuthenticationError(error: validationStatus)
        }
    }
    
    
    private func validateUser(userName : String, passWord : String)-> String{
        if userName == ""{
            return "User name can not be empty"
        }else if passWord == "" {
            return "Password can not be empty"
        }else{
            return ""
        }
    }
}


protocol AuthenticateDelegate : AnyObject{
    func onAuthenticateSuccess(success : Bool)
    func onAuthenticationError(error : String)
}
