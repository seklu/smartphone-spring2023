//
//  ViewController.swift
//  TwoTables
//
//  Created by Wenqi Wang on 2/15/23.
//

/*
 1. hide bottom table upon view is loaded
 2. when a cell of top table is selected, get this cell's text, set currentRestaurant to the text
 3. force bottom table to reload
 4. when bottom table is reloading, it will call func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCel
 5. Because currentRestaurant is changed in step 2, this rendering function knows which food list to use
 */

/**
  action ->  data changes -> view using the data changes
 */


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let restaurants = ["starbucks", "hotpot", "pizzahut"]
    let foods: [String: [String]] = [
        "starbucks": ["coffee", "cake", "sandwich", "juice"],
        "hotpot": ["beef hotpot", "pork hotpot", "lamb hotpot"],
        "pizzahut": ["meat pizza", "vegetable pizza", "sweet pizza"]
    ]

    var currentRestaurant = "starbucks"
    

    @IBOutlet weak var tblViewTop: UITableView!
    
    @IBOutlet weak var tblViewBottom: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblViewBottom.isHidden = true
    }
    
    // Return cell count of a given table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblViewTop {
            return restaurants.count
        }else{
            return (foods[self.currentRestaurant] ?? []).count
        }
    }
    
    // Render the cell of a given table and given cell index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblViewTop {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
            cell.textLabel?.text = restaurants[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
            if let currentFoodList = foods[self.currentRestaurant] {
                cell.textLabel?.text = currentFoodList[indexPath.row]
            }
            return cell
        }
    }

    // Callback to be called by Swift framework when any row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tblViewTop {
            self.currentRestaurant = tableView.cellForRow(at: indexPath)?.textLabel?.text ?? "starbucks"
            tblViewBottom.reloadData()
            tblViewBottom.isHidden = false
        }
    }
}

