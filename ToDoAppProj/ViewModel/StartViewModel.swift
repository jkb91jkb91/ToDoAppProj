//
//  ViewModel.swift
//  ToDoApp
//
//  Created by XCodeClub on 2019-09-05.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import Foundation
import CoreData


class StartViewModel {
    
    
    var tasks = [Task]()
    

    func fetchRequest() {
        
        let fetch: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            let task = try context.fetch(fetch)
            tasks = task
        } catch {}
    }
    
    func taskCounter() -> Int {
        
        return tasks.count
    }
    
    func deleteTask(task: Task) {
 
        context.delete(task)
        do {
            try context.save()
        } catch {}
    }
        
}
    
    

    
    
    
    
    
    
    
    

