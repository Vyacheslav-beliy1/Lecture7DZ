//
//  UserDefaultsDataBase.swift
//  Lecture7DZ
//
//  Created by beliy on 7/5/17.
//  Copyright © 2017 beliy. All rights reserved.
//

enum TasksType: String{
    case toDoList
    case shopingList
}

import Foundation

class UserDefaultsDataBase
{
    class func save(tasks: [Task],withType type:TasksType)
    {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: tasks)
        UserDefaults.standard.set(encodedData, forKey: type.rawValue)
    }
    
    class func fetchTasks(withType type:TasksType) -> [Task]?
    {
        if let data = UserDefaults.standard.object(forKey: type.rawValue),
            let tasks = NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as? [Task] {
            return tasks
        } else {
            print("There is an issue")
            return nil;
        }
    }
}
