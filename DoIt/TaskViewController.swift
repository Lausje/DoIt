//
//  TaskViewController.swift
//  DoIt
//
//  Created by Laura van der Stee on 15-04-17.
//  Copyright © 2017 Laura van der Stee. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
/* eerst aanmaken variabelen en buttons linken (alle buttons die geen actie hebben)
 */
    
    @IBOutlet weak var taskTableView: UITableView!
    // link de tableview in de storyboard aan een code.
    
    var taskArray : [Taskclass] = []
    // definieer een variable, die een array is van alle bestaande tasks (entities)

    
/* de functies die bepalen wat er gebeurt als het scherm laad, en als je het opnieuw "laat verschijnen"
 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // De eerste keer dat het scherm laad, doet de app de volgende setup.
        taskTableView.dataSource = self
        taskTableView.delegate = self
        // voor de tabel data en de delegate, kijk naar je eigen code..?
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // elke keer als het scherm opnieuw laad, doet de tabel de volgende taken
        getTasks()
        // het haalt alle taak entities op van de core data en stopt het in de array (zie onderaan)
        taskTableView.reloadData()
        // het laad de data opnieuw, zodat je dit ook daadwerkelijk in het scherm ziet (in de array stoppen is niet data herladen..)
    }
    
/* de functies die bepalen hoe de tabel eruit ziet en waar deze mee geladen wordt, en wat er gebeurt als je iets met die cel doet
 */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
        // definieer hoeveel rijen er in de tabel zitten. dit is hoeveel task entities er in de array zitten
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let taskindex = taskArray[indexPath.row]
        // definieer een constante: taskindex is de taak die in de taskArray op dat plekje staat van de rij waar je je in bevind
        if taskindex.important {
            cell.textLabel?.text = "‼️\(taskindex.name!)"
        } else{
            cell.textLabel?.text = taskindex.name!
        }
        // zo bepalen wat hij moet laten zien. als de taak important is moet hij ook uitroep tekens laten zien, anders alleen de tekst
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = taskArray[indexPath.row]
        performSegue(withIdentifier: "CompleteTaskSegue", sender: task)
        // voer de "complete task segue" uit. de sender is de task, en de task heb je gedefinieerd als de task in de array waar je op dat moment op staat
    }
    
/*  bepalen wat er gebeurt als je op de plus drukt.
 */
    
    @IBAction func plustapped(_ sender: Any) {
        //we hebben de button gelinkt aan de code, maar in plaats van een outlet hebben we een functie gemaakt voor een actie.
        performSegue(withIdentifier: "addTaskSegue", sender: nil)
        // uitvoeren  van de segue addtasksegue, in de storyboard gedefinieerd als naar de eerste pagina gaan
    }
    
/*  doel van de functie is om alles uit de core data te halen en het in de array te stoppen (taskArray). we gebruiken taskArray om te bepalen hoeveel regels de tabel moet hebben en wat hij op elke regel moet showen (indexpath).
 */
    func getTasks() {
        // definieer eerst de context. je maakt contact met de database
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            taskArray = try context.fetch(Taskclass.fetchRequest()) as! [Taskclass]
            // definieer de taskArry, die je "fetcht" uit de context, dus de database
            print(taskArray)
        } catch {
            print("oeps, we have an error!!")
        }
        // het do, try, catch en print gedoe is in verband met mogelijke errors. moet je doen als er "throw" staat in de list...
    }
/*  het allerlaatste dat dit scherm doet voordat het andere scherm geladen wordt. vraag: is dit nog nodig als je werkt met core data??
*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CompleteTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Taskclass
        }
    }
    
}
