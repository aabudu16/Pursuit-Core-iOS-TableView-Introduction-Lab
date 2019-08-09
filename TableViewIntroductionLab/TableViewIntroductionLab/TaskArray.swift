//
//  TaskArray.swift
//  TableViewIntroductionLab
//
//  Created by Mr Wonderful on 8/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct TaskArray {
    
    var notStartedArray:[Task] = []
    var inProgressArray:[Task] = []
    var completed:[Task] = []
    
    
    mutating func populateArraysWithTasks(from newTasks: [Task] = Task.allTasks){
        
        for task in newTasks{
            switch task.status{
            case .notStarted:
                notStartedArray.append(task)
            case .inProgress:
                inProgressArray.append(task)
            case .completed:
                completed.append(task)
            }
        }
    }
}
