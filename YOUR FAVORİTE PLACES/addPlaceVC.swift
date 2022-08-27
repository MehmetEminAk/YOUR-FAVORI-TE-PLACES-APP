//
//  addPlaceVC.swift
//  YOUR FAVORİTE PLACES
//
//  Created by Macbook Air on 27.08.2022.
//

import UIKit
import MapKit


class addPlaceVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var placeDescriptionTF: UITextField!
    @IBOutlet weak var placeNameTF: UITextField!
    @IBOutlet weak var placeImg: UIImageView!
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate.longitude = locations[0].coordinate.longitude
        annotation.coordinate.latitude = locations[0].coordinate.latitude
        annotation.title = "YOU ARE HERE"
        locationManager.stopUpdatingLocation()
        
        mapView.addAnnotation(annotation)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "SAVE", style: .plain, target: self, action: #selector(addPlaceDB))
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            
        }
        
        
        else {
            // Kullanıcıyı ayarlara göndertip uygulamanın konum erişimini açmasını sağlayacak alert ' i göster
            
        }
    }
    @objc func addPlaceDB(){
        
    }
}
