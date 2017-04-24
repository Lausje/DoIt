//
//  AddTaskViewController.swift
//  DoIt
//
//  Created by Laura van der Stee on 16-04-17.
//  Copyright © 2017 Laura van der Stee. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

/* gedeelte waar je variabelen en knoppen definieert
 */
    @IBOutlet weak var taskNaamVeld: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
/* gedeelte dat bepaalt wat er gebeurt als de view geladen wordt
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
/* definieer wat er gebeurt als je op de "voeg toe" knop drukt. hij voegt een task toe met de eigenschappen naam en important, en die voegt hij toe aan de context, die je gedefinieert had als database. dat slaat hij op, daarna gaat hij terug naar het eerste scherm
*/
    @IBAction func addTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Taskclass(context: context)
        task.name = taskNaamVeld.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }

}
