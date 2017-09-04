//
//  Item.swift
//  LikeLike
//
//  Created by Ryan Arana on 9/4/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import Foundation

final class Item {
    let id: String
    var title: String
    var rating: Double
    var photoUrl: URL? = nil

    init(id: String, title: String, rating: Double = 0, photoUrl: URL? = nil) {
        self.id = id
        self.title = title
        self.rating = rating
        self.photoUrl = photoUrl
    }
}
