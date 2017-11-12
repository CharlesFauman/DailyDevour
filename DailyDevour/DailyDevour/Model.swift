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
    
    /*
    public func getEvent(host_name : String, event_name : String, location_coor : (Double, Double)) -> Event {
        
        // query the specific event in the database
        
        
        let event = Event(host: <#T##host_type#>, name: <#T##String#>, location_name: <#T##String#>, location_coor: <#T##(Double, Double)#>, tags: <#T##[Tag]#>, start_time: <#T##Date#>, end_time: <#T##Date#>, website: <#T##String?#>)
        
        return event
    }
    */
    
    // private
    
    
    
}
