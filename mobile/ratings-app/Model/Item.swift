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

extension RLMResults {
    func arraySortedByProperty(propertyName: String!, ascending: Bool) -> [RLMObject] {
        return map( self.sortedResultsUsingProperty(propertyName, ascending: ascending) ) { (r: RLMObject) -> RLMObject in
            return r
        }
    }
}

class Item: RLMObject {

    dynamic var imagePath = "default.png"
    dynamic var rating: Double = 0
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

}
