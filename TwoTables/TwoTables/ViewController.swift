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

/*logic of the last two chunks:
when the user taps on a cell in the first table view, the iOS framework detects this and triggers a callback to the view controller's didSelectRowAt method. This is because the view controller has registered itself as the delegate for the table view, which means that it is notified of certain events that occur in the table view.

The didSelectRowAt method then updates the currentRestaurant property of the view controller to the selected restaurant. It then calls tblViewBottom.reloadData(), which tells the table view that displays the food items to reload its data. When you call reloadData(), the table view will ask its data source (in this case, the view controller) to provide new cells and data for each row. This is done by calling the tableView(_:cellForRowAt:) method on the view controller, which in turn updates the cells of the second table view to show the correct food items for the currently selected restaurant.

The Swift framework is simply the collection of tools and libraries that the developer uses to build an app for iOS. It includes things like the UIKit framework, which provides classes like UITableView and UIViewController that the developer can use to create a user interface for the app. When the user interacts with the app (such as by tapping on a cell in a table view), the framework detects this and triggers the appropriate callbacks to the developer's code (such as didSelectRowAt).
*/
