//
//  DetailLocationViewController.swift
//  CatLocation
//
//  Created by 정기욱 on 20/03/2019.
//  Copyright © 2019 Kiwook. All rights reserved.
//

import UIKit
import Foundation
import GoogleMaps


class DetailLocationViewController: UIViewController, CLLocationManagerDelegate {
    
    var cvo: CatVO!
    
    override func loadView() {
        guard let lati = self.cvo.latitude, let longi = self.cvo.longitude else {
            print("error")
            return
        }
       
        let camera = GMSCameraPosition.camera(withLatitude: lati, longitude: longi, zoom: 19.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lati, longitude: longi)
        marker.title = "\(cvo.catName!)"
        marker.snippet = "\(cvo.catDescription!)"
        marker.map = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let name = cvo.catName else {
            print("error")
            return
        }
        self.navigationItem.title = name
    }
    
    

    
    
}
