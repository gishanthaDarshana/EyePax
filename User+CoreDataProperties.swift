//
//  User+CoreDataProperties.swift
//  
//
//  Created by Gishantha Darshana on 5/28/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var passWord: String?
    @NSManaged public var userName: String?

}
