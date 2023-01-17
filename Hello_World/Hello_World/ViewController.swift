//
//  ViewController.swift
//  Hello_World
//
//  Created by 王文琪 on 1/16/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var IBlabel: UILabel!
    
    @IBAction func pressMeAction(_ sender: UIButton) {
        print("Button was pressed!")
        IBlabel.text = "Hello World"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("I am inside the function")
    }


}

