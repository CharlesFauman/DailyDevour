//
//  MapViewController.swift
//  DailyDevour
//
//  Created by Ido Tamir on 11/11/17.
//  Copyright © 2017 DailyDevour. All rights reserved.
//

import Foundation
import UIKit
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var map_view: MKMapView!
    
    var events: [Event]!;
    
    func getOnGoingEvents() {
        //sets events
        
        let e1 = Event(host: "Alpha", name: "Get burgers", location_name: "DCC", location_coor: (43, -72), tags: [], start_time: Date.init(), end_time: Date.init(), website: nil);
        
        let e2 = Event(host: "Phi", name: "Get drunk", location_name: "Adams house", location_coor: (44, -73), tags: [], start_time: Date.init(), end_time: Date.init(), website: nil);
        
        events = [e1, e2];
    }
    
    override func viewDidLoad() {
        getOnGoingEvents();
        addEventsToMap();
        map_view.userTrackingMode = .followWithHeading;
        map_view.delegate = self;
        
    }
    
    func getSearchedEvents() -> [Event] {
        var good_events: [Event] = [];
        guard let text = searchBar.text, text != "" else {return events;}
        for event in events {
            if event.contains(word: text.lowercased()){
                good_events.append(event);
            }
        }
        return good_events;
    }
    
    func searchBar(_: UISearchBar, textDidChange: String) {
        let event_subset = getSearchedEvents();
        updateMap(with: event_subset);
    }

    func updateMap (with event_subset: [Event]) {
        map_view.removeAnnotations(map_view.annotations);
        
        for event in event_subset {
            let annotation = MKPointAnnotation();
            annotation.title = event.name;
            annotation.subtitle = event.host;
            
            annotation.coordinate =  CLLocationCoordinate2D(latitude: event.location_coor.lat, longitude: event.location_coor.long);
            
            map_view.addAnnotation(annotation);
        }
        
    }
    
    func addEventsToMap(){
        map_view.removeAnnotations(map_view.annotations);
        
        for event in events {
            let annotation = MKPointAnnotation();
            annotation.title = event.name;
            annotation.subtitle = event.host;

            annotation.coordinate =  CLLocationCoordinate2D(latitude: event.location_coor.lat, longitude: event.location_coor.long);
            
            map_view.addAnnotation(annotation);
        }
    }
    
    
}
