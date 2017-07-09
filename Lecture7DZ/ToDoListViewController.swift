//
//  ToDoListViewController.swift
//  Lecture7DZ
//
//  Created by beliy on 7/6/17.
//  Copyright © 2017 beliy. All rights reserved.
//

import UIKit

class ToDoListViewController: TasksViewController {

    override func viewDidLoad() {
        tasksType = .toDoList
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
