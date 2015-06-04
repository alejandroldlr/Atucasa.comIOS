//
//  Restaurant.swift
//  Atucasa.com
//
//  Created by Administrator on 5/24/15.
//  Copyright (c) 2015 iss. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class Restaurant: Mappable  {
    
    var name : String!
    var foodtype: String!
    var schedule: String!
    var status: String!
    var imageid: String!
    var address : String!
    var phone : String!
    
    /*init(name: String, address: String, phone: String ){
      self.name = name
      self.address = address
      self.phone = phone
    }*/
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        foodtype <- map["foodtype"]
        schedule <- map["schedule"]
        status <- map["status"]
        imageid <- map["imageid"]
        address <- map["address"]
        phone <- map["phone"]
        
    }
    
}