//
//  Model.swift
//  DailyDevour
//
//  Created by faumac on 11/11/17.
//  Copyright © 2017 DailyDevour. All rights reserved.
//

import Foundation
import os

typealias host_type = String



enum Tag{
    case free, coffee, greek, breakfast, lunch, dinner, humanitarian, snack, undefined;
    
    init(name: String) {
        switch name {
        case "Free":
            self = .free;
        case "Coffee":
            self = .coffee
        case "Greek":
            self = .greek;
        case "Breakfast":
            self = .breakfast;
        case "Lunch":
            self = .lunch;
        case "Dinner":
            self = .dinner;
        case "Humanitarian":
            self = .humanitarian;
        case "Snack":
            self = .snack;
        default:
            self = .undefined;
            os_log("An undefined tag was created", log: OSLog.default, type: OSLogType.error);
        }
    }
    
    func getName() -> String {
        switch self {
        case .free:
            return "Free";
        case .coffee:
            return "Coffee";
        case .greek:
            return "Greek";
        case .breakfast:
            return "Breakfast";
        case .lunch:
            return "Lunch";
        case .dinner:
            return "Dinner";
        case .humanitarian:
            return "Humanitarian";
        case .snack:
            return "Snack";
        default:
            return "Undefined Tag";
        }
    }
}


/**
 Non mutable storage of event information
 **/
struct Event {
    
    // variables
    let host : String
    let name : String
    let location_name : String;
    let location_coor : (lat: Double, long: Double);//latitude, logitude
    let tags : [Tag];
    let start_time : Date;
    let end_time : Date;
    let website: String?;
    
    
    
    // public
    init(host : host_type, name: String, location_name : String, location_coor : (Double, Double), tags : [Tag], start_time : Date, end_time : Date, website: String?){
        self.host = host
        self.name = name;
        self.location_name = location_name;
        self.location_coor = location_coor;//latitude, logitude
        self.start_time = start_time;
        self.end_time = end_time;
        self.tags = tags;
        self.website = website;
    }
    
    func contains(word: String) -> Bool {
        if host.lowercased().contains(word) {return true;}
        if name.lowercased().contains(word) {return true;}
        if location_name.lowercased().contains(word) {return true;}
        for tag in tags {
            if tag.getName().lowercased().contains(word) {return true}
        }
        return false;
    }
    
    
}


class Model{
    // variables
    
    
    
    // public
    //public func getAllEvents() -> {
        
    //}
    
    public static func getAllEvents() -> [Event]{
        guard let events_url = URL(string: "http://aws-website-dailydevour-vz8my.s3-website-us-east-1.amazonaws.com/event_list_test.txt") else{
            print("bad url")
            return []
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
        
        let events = mytext.components(separatedBy : "\n")
        for event in events{
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
        
        return all_events
    }
    
    
    
    
    /*
     public func getEvent(host_name : String, event_name : String, location_coor : (Double, Double)) -> Event {
     
     // query the specific event in the database
     
     
     let event = Event(host: <#T##host_type#>, name: <#T##String#>, location_name: <#T##String#>, location_coor: <#T##(Double, Double)#>, tags: <#T##[Tag]#>, start_time: <#T##Date#>, end_time: <#T##Date#>, website: <#T##String?#>)
     
     return event
     }
     */
    
    // private
    
    
    
}
