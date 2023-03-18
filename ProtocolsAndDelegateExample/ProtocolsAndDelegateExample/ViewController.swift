//
//  ViewController.swift
//  ProtocolsAndDelegateExample
//
//  Created by 王文琪 on 3/7/23.
//

import UIKit

class ViewController: UIViewController, SetStatusDelegate {
    
//protocol is way of communication between two classes, since they cant talk directly
//use procotol to pass information with each other--setstatusdelegate is the protocol-This function will be called by the second view controller to update the status in the first view controller.
//the second view controller is the delegate of the first view controller. A delegate is simply an object that is assigned to do some work on behalf of another object. The second view controller is assigned to do the work of updating the status in the first view controller.
//To make this work, the first view controller needs to have a reference to the second view controller, and the second view controller needs to conform to the SetStatusDelegate protocol.
//When the user enters a status in the second view controller and taps the "Set Status" button, the second view controller calls the setStatus(status : String) function on the first view controller, passing the status entered by the user as an argument.
    
    /*
     1.Create a swift file which has a protocol
     2.This protocol will have the function that would have to be implemented when someone conforma to it
     3.In the second VC we will add an optional variable for the protocol
     4.In the second VC whenever the action is taken we will call the protocol function
     5.In the first VC conform to the protocol
     6.You would have to implement the function defined in the protocol
     7.In the function do your implementation
     8.WHen we are going to second VC, start listening to the second VC's variable defined in step 3
     */

    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gotoSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "segueSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.SetStatusHere = self
            guard let name = txtName.text else {return}
            secondVC.name = name
    }
        
    }
    func setStatus(status: String) {
        lblStatus.text = "My Status is : \(status)"
        //print("I am here")
    }
    
}

