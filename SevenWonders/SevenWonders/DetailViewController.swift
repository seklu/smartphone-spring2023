//
//  DetailViewController.swift
//  SevenWonders
//
//  Created by 王文琪 on 3/18/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var descriptionText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        var alert = UIAlertController(title: "Title", message: "Message", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:"OK", style: .default))
        self.present(alert, animated: true)
        // Do any additional setup after loading the view.
    }
    

}
