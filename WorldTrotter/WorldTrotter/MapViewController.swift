//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Scharf, Adam on 4/13/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var mapView: MKMapView!
    
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        
        // Set it as *the* view of this view controller
        view = mapView
        
        
        ///////////// SegmentedControl \\\\\\\\\\\\\
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingContraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingContraint.active = true
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged), forControlEvents: .ValueChanged)
        
        
        ///////////// Button \\\\\\\\\\\\\
        let userLocationButton = UIButton(type: .System)
        userLocationButton.backgroundColor = UIColor.whiteColor()
        userLocationButton.setTitle("Current Location", forState: UIControlState.Normal)
        //userLocationButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        
        userLocationButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userLocationButton)
        
        userLocationButton.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor).active = true
        userLocationButton.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor, constant: -8).active = true
        
        userLocationButton.addTarget(self, action: #selector(zoomToUserLocation), forControlEvents: .TouchUpInside)
    }
    
    override func viewDidLoad() {
        // Always call the super implementation of viewDidLoad
        super.viewDidLoad()
        
        mapView.userLocation
        
        print("MapViewController loaded its view")
    }
    
    func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
    
    func zoomToUserLocation(button: UIButton) {
        let userLocation = mapView.userLocation
    }
}
