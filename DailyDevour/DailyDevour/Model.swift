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
    let tags : [Tag];
    let start_time : Date;
    let end_time : Date;
    let website: String?;
    
    
    
    // public
    init(host : host_type, tags : [Tag], start_time : Date, end_time : Date, website: String?){
        self.host = host
        self.start_time = start_time;
        self.end_time = end_time;
        self.tags = tags;
        self.website = website;
    }
    
    
}


class Model{
    // variables
    
    
    
    // public
    
    
    
    // private
    
    
    
}
