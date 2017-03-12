//
//  CompleteTaskViewController.swift
//  Todo List
//
//  Created by Chris Brocklesby on 12/03/2017.
//  Copyright © 2017 Chris Brocklesby. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    var previousVC = TasksViewController()
    
    var task = Task()
    
    @IBOutlet weak var labelTask: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task.important {
            labelTask.text = "! " + task.name
        } else {
            labelTask.text = task.name
        }
    }

    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectCellIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
}
