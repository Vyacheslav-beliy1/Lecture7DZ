//
//  Task.swift
//  Lecture7DZ
//
//  Created by beliy on 7/5/17.
//  Copyright © 2017 beliy. All rights reserved.
//

import Foundation

/*
 In Swift 4 you have a new protocol that replaces the NSCoding protocol.
 It's called Codable and it supports classes and Swift types! (Enum, structs)
 */
class Task: NSObject, NSCoding {
    
    //var identifier
    var title: String
    var isSelected: Bool
    var identifier: Int32
    
    init(title:String) {
        self.title = title
        self.isSelected = false
        self.identifier = Int32(arc4random_uniform(UInt32(Int32.max)))
    }
    
    init(title:String, selected: Bool, identifier: Int32) {
        self.title = title
        self.isSelected = selected
        self.identifier = identifier
    }
    
    init(job:Job)
    {
        self.title = job.text ?? "text is not available"
        self.isSelected = job.isSelected
        self.identifier = job.identifier
    }
    
    required convenience init?(coder decoder: NSCoder) {
        guard let title = decoder.decodeObject(forKey: "title") as? String else { return nil }
        
        let isSelected = decoder.decodeBool(forKey: "isSelected")
        let identifier = decoder.decodeInt32(forKey: "id")
        
        self.init(title: title,selected: isSelected, identifier:identifier)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.title, forKey: "title")
        coder.encode(self.isSelected, forKey: "isSelected")
        coder.encode(self.identifier, forKey: "id")
    }
}




















