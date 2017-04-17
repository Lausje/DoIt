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
    var task : Taskclass? = nil

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task!.important {
            TaskNameLabel.text = "‼️\(task!.name!)"
        } else {
            TaskNameLabel.text = task!.name!
        }
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
