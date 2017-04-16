//
//  AddTaskViewController.swift
//  DoIt
//
//  Created by Laura van der Stee on 16-04-17.
//  Copyright © 2017 Laura van der Stee. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskNaamVeld: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!

    var previousVC = TaskViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    @IBAction func addTapped(_ sender: Any) {
        // create a task met de info van het tekstveld en important switch
        let task = Taskclass()
        task.name = taskNaamVeld.text!
        task.important = importantSwitch.isOn
        
        // maak nieuwe taak en voeg deze toe in de array
        previousVC.taskArray.append(task)
        previousVC.taskTableView.reloadData()
        navigationController!.popViewController(animated: true)
    }

}
