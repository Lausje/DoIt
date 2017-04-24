//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Laura van der Stee on 16-04-17.
//  Copyright © 2017 Laura van der Stee. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
let gradientLayer = CAGradientLayer()
/* gedeelte waar je variabelen en knoppen definieert
*/
    
    @IBOutlet weak var TaskNameLabel: UILabel!
    var task : Taskclass? = nil

/* gedeelte waar je bepaalt wat er gebeurt als de view laad
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if task!.important {
            TaskNameLabel.text = "‼️\(task!.name!)"
        } else {
            TaskNameLabel.text = task!.name!
        }
    }
/* functie om te bepalen wat er gebeurt als je op de "gedaan" knop drukt. definieer weer de database, voer de opdracht voor deleten uit, sla het op, ga terug naar vorige scherm
 */
    @IBAction func completeTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
