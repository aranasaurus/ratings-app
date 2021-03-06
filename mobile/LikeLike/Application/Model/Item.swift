//
//  Item.swift
//  LikeLike
//
//  Created by Ryan Arana on 9/4/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import Foundation

struct Item: Codable {
    static let defaultID: String = "__default__"

    let id: String
    var title: String
    var rating: Double
    var photoUrl: URL?
    var comments: String?
    var tags: [Tag]

    init(id: String, title: String, rating: Double = 0, photoUrl: URL? = nil, comments: String? = nil, tags: [Tag] = []) {
        self.id = id
        self.title = title
        self.rating = rating
        self.photoUrl = photoUrl
        self.comments = comments
        self.tags = tags
    }

    init(title: String, rating: Double = 0) {
        self.init(id: Item.defaultID, title: title, rating: rating)
    }
}

