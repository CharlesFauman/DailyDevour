//
//  Model.swift
//  DailyDevour
//
//  Created by faumac on 11/11/17.
//  Copyright © 2017 DailyDevour. All rights reserved.
//

import Foundation

typealias host_type = String



enum TagEnum{
    case free, coffee;
    
    init?(name: String) {
        switch name {
        case "Free":
            self = .free;
        case "Coffee":
            self = .coffee
        default:
            self = nil;
        }
    }
    
    func getName() -> String {
        switch self {
        case .free:
            return "Free";
        case .coffee:
            return "Coffee";
        default:
            return "Unrecognized Tag";
        }
    }
}


/**
 Non mutable storage of event information
 **/
class EventType{
    
    // variables
    let host : String
    
    
    
    // public
    init(host : host_type){
        self.host = host
    }
    
    
}


class Model{
    // variables
    
    
    
    // public
    
    
    
    // private
    
    
    
}
