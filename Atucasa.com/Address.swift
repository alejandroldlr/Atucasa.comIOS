//
//  Address.swift
//  Atucasa.com
//
//  Created by Administrator on 5/3/15.
//  Copyright (c) 2015 iss. All rights reserved.
//

import UIKit
import CoreData
@objc (Model)

class Address: NSManagedObject {
    @NSManaged var street:String;
    @NSManaged var houseNumber:String;
    @NSManaged var refStreet1:String;
    @NSManaged var refStreet2:String;
    @NSManaged var building:String;
    @NSManaged var phone:String;
}
