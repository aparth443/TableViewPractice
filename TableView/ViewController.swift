//
//  ViewController.swift
//  TableView
//
//  Created by cumulations on 18/05/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    var teams = [
        "Royal Challangers Bangalore", "Mumbai Indians", "Chennai Super Kings", "Delhi Capitals", "Punjab Kings", "Gujarat Titans", "Rajasthan Royals", "Sunrisers Hyderabad","Kolkata Knight Riders" ,"Lucknow Super Giants","Deccan Chargers Hyderabad", "Kings XI Punjab", "FC Barcelona","Real Madrid", "Man City", "Man United", "Bayern Munich", "AC Milan","Inter Milan","Arsenal", "Liverpool"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        insertNewTeam()
    }
    
    func insertNewTeam(){
        if let textToBeAdded = textField.text{
            teams.append(textToBeAdded)
        }
        let indexPath = IndexPath(row: teams.count-1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with:  .automatic)
        tableView.endUpdates()
        textField.text = ""
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = teams[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            teams.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}

