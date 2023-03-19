//
//  ViewController.swift
//  MakeAnAPICall
//
//  Created by 王文琪 on 3/18/23.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {

    @IBOutlet weak var txtSymbol: UITextField!
    @IBOutlet weak var lblWebsite: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getDetails(_ sender: Any) {
        guard let symbol = txtSymbol.text else {return}
        let url = "\(baseURL)\(symbol)?apikey=\(apiKey)"


        AF.request(url).responseJSON{ response in
            if response.error != nil {
                print ("error in response")
                return
            }
            guard let rawData = response.data else {return}
            print(rawData)
            //converted to a json array
            guard let jsonArray = JSON(rawData).array else {return}
            print(jsonArray)

            guard let info = jsonArray.first else {return}
            print(info)
            
            let price = info["price"].doubleValue
            let website = info["website"].stringValue
            let name = info["companyName"].stringValue
            
           
            //here the self refers to the view controller itself
            self.lblWebsite.text = "Website = \(website)"
            self.lblPrice.text = "Price = \(price)"
            self.lblName.text = "Name = \(name)"
            
        }
        
    }
    

    }
    


