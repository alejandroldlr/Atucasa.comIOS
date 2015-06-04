//
//  RestaurantObj.swift
//  Atucasa.com
//
//  Created by Administrator on 5/30/15.
//  Copyright (c) 2015 iss. All rights reserved.
//

import Foundation

class RestaurantObj  {
    
    var name : String!
    var foodtype: String!
    var schedule: String!
    var status: String!
    var imageid: String!
    var address: String!
    var phone: String!
    
    init(name: String, foodtype: String, schedule: String, status: String, imageid: String, address: String, phone: String){
        self.name = name
        self.foodtype = foodtype
        self.schedule = schedule
        self.status = status
        self.imageid = imageid
        self.address = address
        self.phone = phone
    }
    
    
}