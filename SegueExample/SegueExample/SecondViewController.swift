//
//  SecondViewController.swift
//  SegueExample
//
//  Created by 王文琪 on 3/4/23.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var lblWelcome: UILabel!
    
    var welcomeName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = "Welcome \(welcomeName)"

        // Do any additional setup after loading the view.
    }
    


}
