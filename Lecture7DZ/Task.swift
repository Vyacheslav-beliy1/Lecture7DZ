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

    init(title:String) {
        self.title = title
        self.isSelected = false
    }
    
    init(title:String, selected: Bool) {
        self.title = title
        self.isSelected = selected
    }
    
    required convenience init?(coder decoder: NSCoder) {
        guard let title = decoder.decodeObject(forKey: "title") as? String else { return nil }
        
        let isSelected = decoder.decodeBool(forKey: "isSelected")
        self.init(title: title,selected: isSelected)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.title, forKey: "title")
        coder.encode(self.isSelected, forKey: "isSelected")
    }
}
