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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TaskNameLabel.text = task.name
    }

    @IBAction func CompleteTapped(_ sender: Any) {
    }

}
