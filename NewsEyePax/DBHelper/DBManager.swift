//
//  DBManager.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/28/22.
//
import UIKit
import Foundation
import CoreData
class DBManager{
    static let shared = DBManager()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private init(){}
    
    func getUser()-> [User]?{
        
        var users :[User]?
        do{
            users = try context.fetch(User.fetchRequest())
        }catch let error{
            print(error)
        }
        
        return users
        
    }
    
    func createUser(user : NewUser)-> Bool{
        let dbUser = User(context: context)
        dbUser.email = user.email
        dbUser.passWord = user.passWord
        dbUser.userName = user.userName
        
        do{
            try context.save()
            return true
        }catch let error{
            print(error)
            return false
        }
    }
}
