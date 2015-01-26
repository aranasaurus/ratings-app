//
//  Item.swift
//  ratings-app
//
//  Created by Ryan Arana on 1/25/15.
//  Copyright (c) 2015 Ryan Arana. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Item: NSManagedObject {

    @NSManaged var imageData: NSData
    @NSManaged var rating: Float
    @NSManaged var ratingDate: NSTimeInterval
    @NSManaged var comments: String
    @NSManaged var name: String
    @NSManaged var tags: NSSet

    var image: UIImage? {
        get {
            return UIImage(data: imageData)
        }
    }

    class func entityName() -> String {
        return "Item"
    }

}
