//
//  Job.swift
//  Lecture7DZ
//
//  Created by bws2007 on 16.07.17.
//  Copyright © 2017 beliy. All rights reserved.
//

import UIKit
import CoreData

class Job: NSManagedObject {

    class func findOrCreateJob(with theJob:Task, context: NSManagedObjectContext) throws -> Job
    {
        let request:NSFetchRequest<Job> = Job.fetchRequest()
        request.predicate = NSPredicate(format: "identifier = %d", theJob.identifier)
        
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
    
        let job = Job(context: context)
        job.identifier = theJob.identifier
        job.isSelected = theJob.isSelected
        job.text = theJob.title
        job.ownerUser = try? User.findOrCreateMainUser(context: job.managedObjectContext!)
        
        return job
        
    }
}























