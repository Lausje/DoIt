//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Laura van der Stee on 16-04-17.
//  Copyright © 2017 Laura van der Stee. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    
    
    @IBOutlet weak var TaskNameLabel: UILabel!
    var task = Taskclass()
    
    var previousVC = TaskViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task.important {
            TaskNameLabel.text = "‼️\(task.name)"
        } else {
            TaskNameLabel.text = task.name
        }
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        previousVC.taskArray.remove(at: previousVC.selectedIndex)
        previousVC.taskTableView.reloadData()
        navigationController!.popViewController(animated: true)
        
    }
}
