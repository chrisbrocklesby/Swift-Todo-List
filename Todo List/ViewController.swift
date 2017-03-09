//
//  ViewController.swift
//  Todo List
//
//  Created by Chris Brocklesby on 09/03/2017.
//  Copyright © 2017 Chris Brocklesby. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = createTask()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "! " + task.name
        } else {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func createTask() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Tidy Office"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Pay Bill"
        task3.important = true
        
        return [task1, task2, task3]
    }


}

