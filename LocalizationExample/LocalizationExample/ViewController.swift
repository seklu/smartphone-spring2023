//
//  ViewController.swift
//  LocalizationExample
//
//  Created by 王文琪 on 3/25/23.
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

/*
 1. add localization language in your app
    click on the project name
    click on the project name in project section
    in localization click and add your language
 2. add a new string file call it localizable
    in that string file add the key value for the strings you want to be translated
    click on localize button on the right side of the inspector panel
    check all the languages you want to localize
    now the localizebale file should have 2-3 files inside
    change the value to localized string for each language
  3. create a new folder and add a new swift file called LocalizationUtils
    add variables for the keys of the key value
 */

