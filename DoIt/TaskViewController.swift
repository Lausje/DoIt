//
//  TaskViewController.swift
//  DoIt
//
//  Created by Laura van der Stee on 15-04-17.
//  Copyright © 2017 Laura van der Stee. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var taskTableView: UITableView!
    // link de tableview in de storyboard aan een code.
    
    var taskArray : [Taskclass] = []
    // definieer een variable, die een array is van alle bestaande tasks
    
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        taskArray = makeTasksfunc()
        // zet de variabele gelijk aan een functie, die je hieronder definieert.
        
        taskTableView.dataSource = self
        taskTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
        // definieer hoeveel rijen er in de tabel zitten
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let taskindex = taskArray[indexPath.row]
        // definieer een constante: task is de taak die in de tasklist op dat plekje staat van de rij waar je je in bevind
        if taskindex.important {
            cell.textLabel?.text = "‼️\(taskindex.name)"
        } else{
            cell.textLabel?.text = taskindex.name
        }
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let task = taskArray[indexPath.row]
        performSegue(withIdentifier: "CompleteTaskSegue", sender: task)
    }
    
    func makeTasksfunc() -> [Taskclass] {
        let task1 = Taskclass()
        task1.name = "koop bier"
        task1.important = false
        
        let task2 = Taskclass()
        task2.name = "geef planten water"
        task2.important = true
        
        let task3 = Taskclass()
        task3.name = "maak risotto"
        task3.important = true
        
        return [task1, task2, task3]
    }
    @IBAction func plustapped(_ sender: Any) {
        //we hebben de button gelinkt aan de code, maar in plaats van een outlet hebben we een functie gemaakt voor een actie.
        performSegue(withIdentifier: "addTaskSegue", sender: nil)
        // de functie voor deze actie is dus het uitvoeren van een segue. de identifier van de segue is gedefinieerd in de storyboard (link tussen 2 paginas)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTaskSegue" {
            let nextVC = segue.destination as! AddTaskViewController
            nextVC.previousVC = self
        }
        if segue.identifier == "CompleteTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Taskclass
            nextVC.previousVC = self
        }
    }
    
}
