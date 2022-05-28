//
//  RegistrationVM.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/28/22.
//

import Foundation
class RegistrationVM{
    
    weak var registrationDelegate : RegistrationDelegate?

    private func validateFields(email : String, userName : String, password : String)-> String{
        if (email.isEmpty){
            return "Email can not be empty"
        }else if (userName.isEmpty){
            return "UserName can not be empty"
        }else if (password.isEmpty){
            return "Password can not be empty"
        }else if (email.isValidEmail() == false){
            return "Invalid Email"
        }else{
            return ""
        }
    }
    
    func registerUser(user : NewUser){
        let userName = user.userName
        let passWord = user.passWord
        let email    = user.email
        let validationStatus = validateFields(email: email, userName: userName, password: passWord)
        if validationStatus == ""{
            if DBManager.shared.createUser(user: user){
                registrationDelegate?.onRegistrationComplete(stats: true)
            }else{
                registrationDelegate?.onRegistrationComplete(stats: false)
            }
        }else{
            registrationDelegate?.onRegistrationError(error: validationStatus)
        }

    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}


protocol RegistrationDelegate : AnyObject{
    func onRegistrationComplete(stats : Bool)
    func onRegistrationError(error : String)
}
