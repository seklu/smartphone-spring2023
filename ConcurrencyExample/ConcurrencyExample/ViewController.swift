//
//  ViewController.swift
//  ConcurrencyExample
//
//  Created by 王文琪 on 4/15/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let data = ["text1", "text2"]

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func listPhotoFiles(strName : String) async -> [String] {
        
        do{
//            try await Task.sleep(until: .now + .seconds(5), clock: .continuous)
//            return ["Image1", "Image2"]
            

        }
        catch{
            print("error")
        }
        return []
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    @IBAction func getListOfFiles(_ sender: Any) {
        
    }
    
    


}

