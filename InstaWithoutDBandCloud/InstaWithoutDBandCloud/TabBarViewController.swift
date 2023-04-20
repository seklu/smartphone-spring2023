//
//  TabBarViewController.swift
//  InstaWithoutDBAndCloud
//
//  Created by 王文琪 on 4/18/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeVC = viewControllers?[0] as! HomeViewController
        let uploadPicVC = viewControllers?[1] as! UploadImageViewController
        uploadPicVC.uploadProtocol = homeVC.self

        // Do any additional setup after loading the view.
    }
   

}
