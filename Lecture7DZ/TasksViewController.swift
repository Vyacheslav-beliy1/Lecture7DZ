//
//  TasksViewController.swift
//  Lecture7DZ
//
//  Created by beliy on 7/5/17.
//  Copyright © 2017 beliy. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {

    @IBOutlet weak var tasksTableView: UITableView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var textField: UITextField!
    
    var tasks: [Task]! = []
    var tasksType: TasksType! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        tasksTableView.tableFooterView = UIView()
        
        tasks = fetchTasks()

        activityView.stopAnimating()
        // Do any additional setup after loading the view.
    }
    
    func fetchTasks() -> [Task]?{
        return UserDefaultsDataBase.fetchTasks(withType: tasksType)
    }
    
    func save(tasks: [Task]){
        UserDefaultsDataBase.save(tasks: tasks,withType: tasksType)
    }
    
    func changeSelectionFor(task: Task) {
        task.isSelected = !task.isSelected
        UserDefaultsDataBase.save(tasks: tasks,withType: tasksType)
    }
    
    func deleteTask(at index: Int) {
        tasks.remove(at: index)
        UserDefaultsDataBase.save(tasks: tasks,withType: tasksType)
    }
}

extension TasksViewController: UITableViewDataSource, UITableViewDelegate
{
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tasks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskTableViewCellIdentifier", for: indexPath)
        let task = (tasks?[indexPath.row])!
        cell.textLabel?.text = task.title

        if (task.isSelected)
        {
            cell.accessoryType = .checkmark
        }
        else
        {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        changeSelectionFor(task: tasks[indexPath.row])
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .middle)
        tableView.endUpdates()
    }
    
    /*func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }*/
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteTask(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}

extension TasksViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, text.characters.count > 0
        {
            tasksTableView.beginUpdates()
            
            let task = Task(title: text)
            if (tasks?.insert(task, at: 0) == nil)
            {
                tasks = [task]
            }
            tasksTableView.insertRows(at:[IndexPath(row: 0, section: 0)], with: .left)
            
            tasksTableView.endUpdates()
            
            save(tasks: tasks)
        }
        textField.resignFirstResponder()
        
        return true
    }
}







