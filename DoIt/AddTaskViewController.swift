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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    @IBAction func addTapped(_ sender: Any) {
        // create a task met de info van het tekstveld en important switch
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Taskclass(context: context)
        task.name = taskNaamVeld.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // pop back
        navigationController!.popViewController(animated: true)
    }

}
