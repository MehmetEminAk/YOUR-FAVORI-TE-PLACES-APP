//
//  placeDetailVC.swift
//  YOUR FAVORİTE PLACES
//
//  Created by Macbook Air on 27.08.2022.
//

import UIKit
import MapKit
import Parse

class placeDetailVC: UIViewController, MKMapViewDelegate {
    var region : MKCoordinateRegion!
    
    @IBOutlet weak var placeDescription: UILabel!
    @IBOutlet weak var placeNameLbl: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var placeImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
       
        let query = PFQuery(className: "Places")
        query.whereKey("placeName", equalTo: String(locationInfos.sharedInstances.locationName))
        query.findObjectsInBackground { objects, error in
            if error != nil {
                self.returnAlert(title: "ERROR!", errBody: error!.localizedDescription)
                
                
            }else{
                for object in objects! {
                    self.placeNameLbl.text = object.object(forKey: "placeName") as! String
                    
                }
            }
        }
        
      
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
