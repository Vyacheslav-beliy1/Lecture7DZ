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

    var container:NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    override func viewDidLoad() {
        self.tasksType = .jobList
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func fetchTasks() -> [Task]? {
        
        //we can improve this line of code
        var tasks: [Task] = []
        
        if let context = container?.viewContext
        {
            let jobRequest: NSFetchRequest<Job> = Job.fetchRequest()
            
            if let jobs = try? context.fetch(jobRequest)
            {
                print("Jobs = \(jobs.count)")
                
                for job in jobs
                {
                    let task = Task(job: job)
                    tasks.append(task)
                }
            }
        }
        
        return tasks;
    }
    
    override func save(tasks: [Task]) {
        updateDataBaseModel(with:tasks)
    }
    
    override func deleteTask(at index: Int) {
        if let context = container?.viewContext
        {
            _ = try? Job.delete(theJob: tasks[index], context: context)
            
            try? context.save()
            
            printDataBaseInforamtion()
            
            tasks.remove(at: index)
        }
    }
    
    override func changeSelectionFor(task: Task) {
        if let context = container?.viewContext
        {
            _ = try? Job.update(theJob: task, context: context)
            
            try? context.save()
            
            printDataBaseInforamtion()
        }
    }
    
    // MARK: CoreData
    func updateDataBaseModel(with tasks: [Task])
    {
        container?.performBackgroundTask{ [weak self] context in
            
            for task in tasks {
                _ = try? Job.findOrCreateJob(with: task, context: context)
            }
            
            try? context.save()
            
            self?.printDataBaseInforamtion()
        }
    }
    
    func printDataBaseInforamtion()
    {
        if let context = container?.viewContext
        {
            context.perform {
                
                let jobRequest: NSFetchRequest<Job> = Job.fetchRequest()
                let userRequest: NSFetchRequest<User> = User.fetchRequest()
                
                if let jobsCount = (try? context.fetch(jobRequest))?.count
                {
                    print("Jobs = \(jobsCount)")
                }
                
                if let usersCount = try? context.count(for: userRequest)
                {
                    print("User \(usersCount)")
                }
            }
        }
    }
}







































