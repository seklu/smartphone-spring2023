//
//  ViewController.swift
//  tableView
//
//  Created by 王文琪 on 2/15/23.
//

import UIKit

//delegate means if something happens to the table, i will be responsible for it
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let restaurants = ["Starbucks", "Hotpot", "PizzaHut"]
    

//drag and drop to have access on the code
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = restaurants[indexPath.row]
        return cell
    }


}

