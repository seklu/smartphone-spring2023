//
//  ViewController.swift
//  SegueExample
//
//  Created by 王文琪 on 3/4/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func goToSecondVC(_ sender: Any) {
        //when i press on that button, i want to perform a segue.
        //i build the segue from first vc to second, and perfom that thourgh press the button
        //the difference is here, the button is not dependent on that segue
        //when things happen, we can direct the button to perform  another segue, like when login fails.
        performSegue(withIdentifier: "segueSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSecondVC"{
            let secondVC = segue.destination as! SecondViewController
            guard let name = txtName.text else {return}
            secondVC.welcomeName = name
        }
    }
    
}

