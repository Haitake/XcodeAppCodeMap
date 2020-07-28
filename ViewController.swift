//
//  ViewController.swift
//  XcodeMapApp
//
//  Created by Ladislav Suranovský on 04/03/2020.
//  Copyright © 2020 Ladislav Suranovský. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var map: MKMapView!

    @IBAction func OoClickSearch(_ sender: Any) {

        let searcRequest = MKLocalSearch.Request()
        searcRequest.naturalLanguageQuery = search.text
        let activeSearch = MKLocalSearch(request: searcRequest)
        activeSearch.start { (response, error) in
            if response == nil {
                print("ERROR")
            } else {

                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                let annotation = MKPointAnnotation()
                annotation.title = self.search.text
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.map.addAnnotation(annotation)
                let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpan.init(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion.init(center: coordinate, span: span)
                self.map.setRegion(region, animated: true)


            }

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

