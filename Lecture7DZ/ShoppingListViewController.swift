//
//  ShoppingListViewController.swift
//  Lecture7DZ
//
//  Created by beliy on 7/6/17.
//  Copyright © 2017 beliy. All rights reserved.
//

import UIKit

class ShoppingListViewController: TasksViewController {

    override func viewDidLoad() {
        tasksType = .shopingList
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
