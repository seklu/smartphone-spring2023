//
//  HomeViewController.swift
//  InstaWithoutDBAndCloud
//
//  Created by 王文琪 on 4/18/23.
//

import UIKit


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ProtocolUploadImage {

    
    var images: [UIImage] = [UIImage]()
    var locations = [String]()
    var imageTitles : [String] = [String]()

    @IBOutlet weak var tblView: UITableView!
    
//    var uploadImageVC : UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        when at home, need to subscribe to the protocol of another
//        let controller = navigationController?.tabBarController
//        uploadImageVC = navigationController?.tabBarController?.viewControllers?[0]
//        print(uploadImageVC?.title)

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageTitles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500;
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = imageTitles[indexPath.row]
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
//        cell.imgContainer.image = UIImage(named: "images\(indexPath.row)")
        cell.imgContainer.image = images[indexPath.row]
        cell.lblTitle.text = imageTitles[indexPath.row]
        print("cell \(cell.lblTitle.text)")
        cell.lblLocation.text = locations[indexPath.row]
        return cell
    }
    
    func uploadImageDelegate(img: UIImage, locationImg: String, titleImg: String) {
        images.append(img)
        locations.append(locationImg)
        imageTitles.append(titleImg)
        
        tblView.reloadData()
        
        print("i am in the home controller, title is \(titleImg)")
        print("upload \(imageTitles)")
    }
    
    

}
