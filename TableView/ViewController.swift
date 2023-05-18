//
//  ViewController.swift
//  TableView
//
//  Created by cumulations on 18/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    var teams = [
        "RCB", "MI", "CSK", "DC", "PBKS", "GT", "RR", "SRH","KKR" ,"LSG","DCH", "KXIP", "KT", "FCB","RMA"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = teams.sorted()[indexPath.row]
        return cell
    }
}
