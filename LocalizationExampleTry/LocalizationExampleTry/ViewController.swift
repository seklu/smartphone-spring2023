//
//  ViewController.swift
//  LocalizationExampleTry
//
//  Created by 王文琪 on 3/30/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHelloWorld: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblHelloWorld.text = strHelloWorld
    }


}

