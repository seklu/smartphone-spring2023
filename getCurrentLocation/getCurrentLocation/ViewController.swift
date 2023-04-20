//
//  ViewController.swift
//  getCurrentLocation
//
//  Created by 王文琪 on 3/25/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var lblLongitude: UILabel!
    @IBOutlet weak var lblLatitude: UILabel!
    
    // CLLocationManager is a class in the Core Location framework, which is used to manage the delivery of location and heading updates.
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* The locationManager.delegate = self line in viewDidLoad() is setting the view controller as the delegate for the location manager. This means that the view controller will receive updates and messages from the location manager, such as when the location is updated or if there is an error.
         
         In the photo library example, the delegate for the image picker is set when the image picker is created, not in viewDidLoad(). This is because the image picker is a separate object that is only used when the user wants to pick an image, so it is created when needed and then dismissed after it has served its purpose.

         The reason for setting the delegate in viewDidLoad() for the location manager is because the location manager is a long-lived object that will be used throughout the lifetime of the view controller, and the view controller needs to be the delegate for the entire time. On the other hand, the image picker is a short-lived object that is only used briefly, so the delegate can be set when the object is created and then released when it is dismissed.*/
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    @IBAction func getLatLongAction(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        lblLongitude.text = "lng: \(lng)"
        lblLatitude.text = "lat: \(lat)"
    }
    
    //recording 03/25 at 2hr. purpose: print out the address in the terminal
//    func getAddressFromLocation(location: CLLocation){
//        let geoCoder = CLGeocoder()
//        geoCoder.reverseGeocodeLocation(location){ placemarks, error in }
//    }

}

