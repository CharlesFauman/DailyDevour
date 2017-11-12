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
struct Event{
    
    // variables
    let host : String
    let name : String
    let location_name : String;
    let location_coor : (Double, Double);
    let tags : [Tag];
    let start_time : Date;
    let end_time : Date;
    let website: String?;
    
    
    
    // public
    init(host : host_type, name: String, location_name : String, location_coor : (Double, Double), tags : [Tag], start_time : Date, end_time : Date, website: String?){
        self.host = host
        self.name = name;
        self.location_name = location_name;
        self.location_coor = location_coor;
        self.start_time = start_time;
        self.end_time = end_time;
        self.tags = tags;
        self.website = website;
    }
    
    
}


class Model{
    // variables
    
    
    
    // public
    
    // -> [Event]
    public func getAllEvents(){
        let bundleURL = Bundle.main.bundleURL
        //let dataFolderURL = bundleURL.appendingPathComponent("data")
        let fileURL = bundleURL.appendingPathComponent("sample_events.txt")
        print(fileURL.path)
        print(FileManager.default.fileExists(atPath: fileURL.path))
        var mytext : String = ""
        do {
            mytext = try String(contentsOf: fileURL)
        } catch {
            print("error loading contents of:", fileURL, error)
        }
        
        var all_components = mytext.components(separatedBy : "|")
        var event_host = all_components[0]
        var event_name = all_components[1]
        
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
