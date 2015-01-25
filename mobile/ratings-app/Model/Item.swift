//
//  Item.swift
//  ratings-app
//
//  Created by Ryan Arana on 1/25/15.
//  Copyright (c) 2015 Ryan Arana. All rights reserved.
//

import Foundation
import CoreData

class Item: NSManagedObject {

    @NSManaged var createdAt: NSTimeInterval
    @NSManaged var image: NSData
    @NSManaged var rating: Int16
    @NSManaged var comments: String
    @NSManaged var name: String
    @NSManaged var tags: NSSet

}
