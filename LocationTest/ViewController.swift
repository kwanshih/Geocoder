//
//  ViewController.swift
//  LocationTest
//
//  Created by kwan on 2019/3/24.
//  Copyright © 2019 kwan. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    var location: CLLocation?
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let curLocation = locations.last else { return }
        locationLabel.text = "lon:\(curLocation.coordinate.longitude) la:\(curLocation.coordinate.latitude)";
        self.location = curLocation;
    }
    
    func geocoder() {
        if let location = self.location {
            CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
                if let _ = error {
                    self.locationTextView.text = error?.localizedDescription
                }
                
                if let placemarks = placemarks, placemarks.count > 0 {
                    guard let placemark = placemarks.last else { return }
                    self.locationTextView.text = """
                    country:\(placemark.country ?? "")
                    locality:\(placemark.locality ?? "")
                    administrativeArea:\(placemark.administrativeArea ?? "")
                    """
                }
            }
        }
    }
    
    // MARK: Action
    @IBAction func geocoderAction(_ sender: Any) {
        self.geocoder()
    }
    
}

