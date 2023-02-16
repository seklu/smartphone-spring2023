//
//  ViewController.swift
//  NEUStockApp
//
//  Created by 王文琪 on 2/13/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {
    
    @IBOutlet weak var txtStockSymbol: UITextField!
    @IBOutlet weak var lblStockPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getStockPrice(_ sender: Any) {
//        guard works as if else in one line
        guard let symbol = txtStockSymbol.text else {return}
        let url = "\(baseURL)\(symbol)?apikey=\(apiKey)"
//        print("URL = \(url)")
        
        //before we go to fetch the result, use a spinner
        SwiftSpinner.show("working right now for \(symbol)")
        
        Alamofire.request(url).responseJSON{ response in
            //once the result is returned, stop the spinner first
            SwiftSpinner.hide()
            if response.error != nil {
                print ("error in response")
                return
            }
//            print(response.data!)   return 78 bytes
            //always make sure:
            guard let rawData = response.data else {return}
            //converted to a json array
            guard let jsonArray = JSON(rawData).array else {return}
//            print(data)
            //want only the first value! not as the whole list
            guard let stock = jsonArray.first else {return}
//            print(stock)
            //then want the individual value
            let symbol = stock["symbol"].stringValue
            let price = stock["price"].doubleValue
            let volume = stock["volume"].intValue
//            print(symbol)
//            print(price)
//            print(volume)
            //here the self refers to the view controller itself
            self.lblStockPrice.text = "Price = \(price)$"
        }
    }
}

