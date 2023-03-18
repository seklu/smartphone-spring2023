//
//  SecondViewController.swift
//  ProtocolsAndDelegateExample
//
//  Created by 王文琪 on 3/7/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var txtStatus: UITextField!
    var SetStatusHere: SetStatusDelegate?
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = "Welcome \(name)"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setStatusAction(_ sender: Any) {
        guard let status = txtStatus.text else {return}
        
        SetStatusHere?.setStatus(status: status)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
