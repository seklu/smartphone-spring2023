//
//  ViewController.swift
//  AlertControllerExample
//
//  Created by 王文琪 on 3/7/23.
//

import UIKit

class ViewController: UIViewController {

    var txtField: UITextField?
    
    @IBOutlet weak var lblStock: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func showAlertController(_ sender: Any) {
        let alertController = UIAlertController(title: "Alert Controller Title", message: "Alert Controller message", preferredStyle: .alert)
        
        let OKButton = UIAlertAction(title: "OK", style: .default){ action in
            //as the alertcontroller object is created in the end, the ok button does not know textfield,so link the two: take the var and assign it with another var which is in the back
            self.lblStock.text = self.txtField?.text
            print("i am in OK")}
        let cancelButton = UIAlertAction(title: "cancel", style: .cancel){ action in print("i am in cancel")}
        
        alertController.addTextField{ lblTextField in
            self.txtField = lblTextField
            lblTextField.placeholder = "Type stock Value"
        }
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true)
    }
}

