//
//  Tag.swift
//  ratings-app
//
//  Created by Ryan Arana on 1/25/15.
//  Copyright (c) 2015 Ryan Arana. All rights reserved.
//

import Foundation
import Realm

class Tag: RLMObject {

    dynamic var name = ""
    var items: [Item] {
        return linkingObjectsOfClass(Item.className(), forProperty: "tags") as [Item]
    }

}
