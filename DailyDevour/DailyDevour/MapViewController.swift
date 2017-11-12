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
        
        let center = CLLocationCoordinate2D(latitude: 42.729321, longitude: -73.679661)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        map_view.setRegion(region, animated: true)
        
        //sets events
        /*
        let e1 = Event(host: "Alpha", name: "Get burgers", location_name: "DCC", location_coor: (43, -72), tags: [], start_time: Date.init(), end_time: Date.init(), website: nil);
        
        let e2 = Event(host: "Phi", name: "Get drunk", location_name: "Adams house", location_coor: (44, -73), tags: [], start_time: Date.init(), end_time: Date.init(), website: nil);
        
        events = [e1, e2];
        */
        
        guard let events_url = URL(string: "http://129.161.93.241:8000/event_list_test.txt") else{
            print("bad url")
            return
        }
        
        var mytext : String = ""
        do {
            mytext = try String(contentsOf: events_url)
        } catch {
            print("error loading contents of:", events_url, error)
        }
        
        /*
         let bundleURL = Bundle.main.bundleURL
         //let dataFolderURL = bundleURL.appendingPathComponent("data")
         let fileURL = URL(string : "http://aws-website-dailydevour-vz8my.s3-website-us-east-1.amazonaws.com/event_list_test.txt")
         //let fileURL = bundleURL.appendingPathComponent("sample_events.txt")
         //print(fileURL.path)
         //print(FileManager.default.fileExists(atPath: fileURL.path))
         var mytext : String = ""
         do {
         mytext = try String(contentsOf: fileURL!)
         } catch {
         print("error loading contents of:", fileURL, error)
         }
         */
        
        var all_events : [Event] = []
        
        let events_stuff = mytext.components(separatedBy : "\n")
        for event in events_stuff{
            print("next event")
            var all_components = event.components(separatedBy : "|")
            let event_host = all_components[0]
            let event_name = all_components[1]
            let location_name = all_components[2]
            
            let locations = all_components[3].components(separatedBy : ",")
            let latitude = Double(locations[0])!
            let longitude = Double(locations[1])!
            
            
            let dates = all_components[4].components(separatedBy : ",")
            
            let date_formatter = DateFormatter();
            date_formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
            
            let start_date = date_formatter.date(from: dates[0])!
            let end_date = date_formatter.date(from: dates[1])!
            
            let website = all_components[5]
            
            let tags = all_components[6].components(separatedBy : ",").map{Tag(name: $0)}
            
            all_events.append(Event(host: event_host, name: event_name, location_name: location_name, location_coor: (latitude, longitude), tags: tags, start_time: start_date, end_time: end_date, website: website))
            
        }
        
        events = all_events
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
