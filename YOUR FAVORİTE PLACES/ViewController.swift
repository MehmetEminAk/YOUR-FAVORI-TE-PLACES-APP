//
//  ViewController.swift
//  YOUR FAVORİTE PLACES
//
//  Created by Macbook Air on 27.08.2022.
//

import UIKit
import Parse


var locationName : String!

extension UIViewController{
    func returnAlert(title : String , errBody : String) {
        let alert = UIAlertController(title: title, message: errBody, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okBtn)
        self.present(alert, animated: true)
        
        
    }
}
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var placesName : [String]! = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.placesName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = placesName[indexPath.row]
        return cell
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        getPlacesInfos()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        locationInfos.sharedInstances.locationName = placesName[indexPath.row]
        print(locationInfos.sharedInstances.locationName)
        performSegue(withIdentifier: "detailPlaces", sender: nil)
        
    }
    
    @IBOutlet weak var placesTable: UITableView!
    
    
    @objc func gotoAddPlaces(){
        performSegue(withIdentifier: "addPlaces", sender: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        placesTable.delegate = self
        placesTable.dataSource = self
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(gotoAddPlaces))
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func getPlacesInfos(){
        let query = PFQuery(className: "Places")
        query.addDescendingOrder("createdAt")
        query.findObjectsInBackground { objects, error in
            if error != nil {
                self.returnAlert(title: "ERROR!", errBody: error!.localizedDescription)
                
            }else{
                for object in objects! {
                    self.placesName.removeAll()
                    
                    self.placesName.append(object.object(forKey: "placeName") as! String)
                    
                }
                self.placesTable.reloadData()
                
            }
        }
    }
    


}

