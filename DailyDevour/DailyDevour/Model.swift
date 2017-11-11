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
    case free, coffee, undefined;
    
    init(name: String) {
        switch name {
        case "Free":
            self = .free;
        case "Coffee":
            self = .coffee
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
