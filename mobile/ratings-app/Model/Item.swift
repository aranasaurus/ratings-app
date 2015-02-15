//
//  Item.swift
//  ratings-app
//
//  Created by Ryan Arana on 1/25/15.
//  Copyright (c) 2015 Ryan Arana. All rights reserved.
//

import Foundation
import UIKit
import Realm

class Item: RLMObject {

    override class func primaryKey() -> String {
        return "guid"
    }

    dynamic var guid = NSUUID().UUIDString
    dynamic var imagePath = "default.png"
    dynamic var rating: Float = 0
    dynamic var ratingDate = NSDate()
    dynamic var comments = ""
    dynamic var name = ""
    dynamic var tags = RLMArray(objectClassName: Tag.className())

    var image: UIImage? {
        get {
            if let img = UIImage(contentsOfFile: imagePath) {
                return img
            }
            return UIImage(named: "default.png")
        }
    }

    func updateRating(rating: Float) {
        if let r = realm {
            realm.beginWriteTransaction()
        }

        self.rating = rating
        ratingDate = NSDate()

        if let r = realm {
            realm.commitWriteTransaction()
        }
    }

}
