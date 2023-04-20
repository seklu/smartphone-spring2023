//
//  ViewController.swift
//  TakeAPicture
//
//  Created by 王文琪 on 3/25/23.
//

import UIKit
import QRCodeScanner

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, QRCodeScanViewControllerDelegate {

    @IBOutlet weak var lblScannedText: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func takeAPictureAction(_ sender: Any) {
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
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imgView.image = image
            
        }
        picker.dismiss(animated: true)
    }
    
    
    @IBAction func scanQRCodeAction(_ sender: Any) {
        let viewController = QRCodeScanViewController.create()
        
        viewController.delegate = self
        self.present(viewController, animated: true)
        
    }
    
    func qrCodeScanViewController(_ viewController: QRCodeScanViewController, didScanQRCode value: String) {
            
            // Dismiss the view controller
            viewController.dismiss(animated: true) {
                self.lblScannedText.text = value
            
            }
        }
    
    
}

/*
 In summary, the takeAPictureAction function displays an action sheet with two options, "Camera" and "Photo Library", allowing the user to select where to pick an image from. When the user selects an option, the corresponding UIImagePickerController object is created, and the ViewController is set as its delegate. After the user finishes picking an image, the imagePickerController(_:didFinishPickingMediaWithInfo:) function is called to handle the selected media.
 */

