//
//  ViewController.swift
//  UITestingApp
//
//  Created by 王文琪 on 4/15/23.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginAction(_ sender: Any) {
        guard let email = txtEmail.text else {return}
        guard let password = txtPassword.text else {return}
        
        if(email != "me@test.com" || password != "password"){
            lblStatus.isHidden = false
            lblStatus.text = "please enter valid"
            return
        }
        
        lblStatus.isHidden = true
        performSegue(withIdentifier: "segueLogin", sender: self)
    }
    
}

