//
//  UploadViewController.swift
//  FinalPractice
//
//  Created by 王文琪 on 4/21/23.
//

import UIKit
import CoreLocation

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {

    
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    var uploadProtocol : ProtocolUploadImage?
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    
        //test
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
          if status == .authorizedWhenInUse {
              locationManager.startUpdatingLocation()
          }
      }
   
    @IBAction func takeAPicAction(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Take a pic", message: "something", preferredStyle: .alert)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
        }}
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
            }
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) {action in print("Cancel")}
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photoLibraryAction)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet,animated: true)
        
        //get location when take a picture
//        locationManager.requestLocation()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imgView.image = image
            
        }
        picker.dismiss(animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc = locations.last else {return}

        let lat = loc.coordinate.latitude
        let lng = loc.coordinate.longitude
        lblLocation.text = "longitude: \(lng) latitude: \(lat)"
    }
    
    
    
    @IBAction func uploadAction(_ sender: Any) {
        guard let imgPic = imgView.image else {return}
        guard let location = lblLocation.text else {return}
        guard let title = txtTitle.text else {return}
    
        uploadProtocol?.uploadImageDelegate(img: imgPic, locationImg: location, titleImg: title)
        
        self.tabBarController?.selectedIndex = 0
        
//        print("i am in the upload controller, title is \(title)")
    }
    
}
