//
//  ViewController.swift
//  SwipetoDelete
//
//  Created by Laura van der Stee on 24-04-17.
//  Copyright © 2017 Laura van der Stee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var Tableview: UITableView!
    
    var list = ["Canada","Kaapverdie","Indonesie","Venetie","Griekenland"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.Tableview.dataSource = self
        self.Tableview.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = list[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

