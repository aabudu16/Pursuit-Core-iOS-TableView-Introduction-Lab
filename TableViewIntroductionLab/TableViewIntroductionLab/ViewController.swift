//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var task = Task.allTasks
    var taskArray = TaskArray()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("I'm adding more crap to our arrays")
       
        switch section{
        case 0:
            return taskArray.notStartedArray.count
        case 1:
            return taskArray.inProgressArray.count
        case 2:
            return taskArray.completed.count
        default:
            return -1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myIdentifier", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = taskArray.notStartedArray[indexPath.row].name
            cell.detailTextLabel?.text = "\(taskArray.notStartedArray[indexPath.row].dueDate)"
        }
        else if indexPath.section == 1 {
            cell.textLabel?.text = taskArray.inProgressArray[indexPath.row].name
            cell.detailTextLabel?.text = "\(taskArray.inProgressArray[indexPath.row].dueDate)"
        } else {
            cell.textLabel?.text = taskArray.completed[indexPath.row].name
            cell.detailTextLabel?.text = "\(taskArray.completed[indexPath.row].dueDate)"
        }
        
        return cell
    }
    //     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let table = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "myIdentifier")
    //
    //        table.textLabel?.text = task[indexPath.row].name
    //        table.detailTextLabel?.text = "\(task[indexPath.row].dueDate)"
    //        return table
    //    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "notStarted"
        case 1:
            return "inProgress"
        case 2:
            return "completed"
        default:
            return ""
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
         taskArray.populateArraysWithTasks()
    }
    
    @IBOutlet var tableView: UITableView!
    
}


