
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var task = Task.allTasks
    var taskArray = TaskArray()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        taskArray.populateArraysWithTasks()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
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
            cell.detailTextLabel?.text = "\(taskArray.notStartedArray[indexPath.row].dueDate.description(with: .current))"
        }
        else if indexPath.section == 1 {
            cell.textLabel?.text = taskArray.inProgressArray[indexPath.row].name
            cell.detailTextLabel?.text = "\(taskArray.inProgressArray[indexPath.row].dueDate.description(with: .current))"
        } else {
            cell.textLabel?.text = taskArray.completed[indexPath.row].name
            cell.detailTextLabel?.text = "\(taskArray.completed[indexPath.row].dueDate.description(with: .current))"
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
             tableView.backgroundColor = .blue
            return "Not Started"
        case 1:
            tableView.backgroundColor = .green
            return "In Progress"
        case 2:
            tableView.backgroundColor = .yellow
            return "Completed"
        default:
            return ""
        }
    }

    
    @IBOutlet var tableView: UITableView!
    
}


