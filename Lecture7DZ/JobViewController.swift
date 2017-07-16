//
//  JobViewController.swift
//  Lecture7DZ
//
//  Created by bws2007 on 16.07.17.
//  Copyright © 2017 beliy. All rights reserved.
//

import UIKit
import CoreData

class JobViewController: TasksViewController {

    override func viewDidLoad() {
        self.tasksType = .jobList
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func save(tasks: [Task]) {
        super.save(tasks: tasks)
        
        updateDataBaseModel(with:tasks)
    }
    
    func updateDataBaseModel(with tasks: [Task])
    {
        
    }
}
