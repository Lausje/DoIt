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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        taskTableView.dataSource = self
        taskTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        taskTableView.reloadData()
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
            cell.textLabel?.text = "‼️\(taskindex.name!)"
        } else{
            cell.textLabel?.text = taskindex.name!
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = taskArray[indexPath.row]
        performSegue(withIdentifier: "CompleteTaskSegue", sender: task)
    }
    
    @IBAction func plustapped(_ sender: Any) {
        //we hebben de button gelinkt aan de code, maar in plaats van een outlet hebben we een functie gemaakt voor een actie.
        performSegue(withIdentifier: "addTaskSegue", sender: nil)
        // de functie voor deze actie is dus het uitvoeren van een segue. de identifier van de segue is gedefinieerd in de storyboard (link tussen 2 paginas)
    }
    func getTasks() {
        // doel van de functie is om alles uit de core data te halen en het in de array te stoppen (taskArray). we gebruiken taskArray om te bepalen hoeveel regels de tabel moet hebben en wat hij op elke regel moet showen (indexpath).
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            taskArray = try context.fetch(Taskclass.fetchRequest()) as! [Taskclass]
            print(taskArray)
        } catch {
            print("oeps, we have an error!!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CompleteTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Taskclass
        }
    }
    
}
