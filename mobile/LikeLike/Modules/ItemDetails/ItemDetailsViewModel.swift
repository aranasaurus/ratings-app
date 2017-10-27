//
//  ItemDetailsViewModel.swift
//  LikeLike
//
//  Created by Ryan Arana on 10/26/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

struct ItemDetailsViewModel {
    let title: String
    let rating: String
    let image: UIImage?
    let comments: String?
    let tags: [Tag]

    init(item: Item) {
        title = item.title
        rating = String(format: "%0.0f stars", item.rating)
        image = UIImage(contentsOfFile: item.photoUrl?.absoluteString ?? "")
        comments = item.comments
        tags = item.tags
    }
}
