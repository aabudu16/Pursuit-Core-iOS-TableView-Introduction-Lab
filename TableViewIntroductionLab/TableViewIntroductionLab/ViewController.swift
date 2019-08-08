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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
     return task.count
    }
    

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let table = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "myIdentifier")

        table.textLabel?.text = task[indexPath.row].name
        table.detailTextLabel?.text = "\(task[indexPath.row].dueDate)"
        return table
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBOutlet var tableView: UITableView!
    
}

