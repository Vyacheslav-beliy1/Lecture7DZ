//
//  User.swift
//  Lecture7DZ
//
//  Created by bws2007 on 16.07.17.
//  Copyright © 2017 beliy. All rights reserved.
//

import UIKit
import CoreData

let MainUserID: Int32 = 123123123

class User: NSManagedObject {

    class func findOrCreateMainUser(context: NSManagedObjectContext) throws -> User
    {
        let request:NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "identifier = %d", MainUserID)
        
        do
        {
            let matches = try context.fetch(request)
            
            if (matches.count > 0)
            {
                assert(matches.count == 1, "Job is not unique for current identifier")
                return matches.first!
            }
        }
        catch
        {
            throw error
        }
        
        let mainUser = User(context: context)
        mainUser.identifier = MainUserID
        mainUser.name = "Vasya"
        
        return mainUser
    }
}
























