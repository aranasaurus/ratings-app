//
//  ItemCellViewModel.swift
//  LikeLike
//
//  Created by Ryan Arana on 9/4/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import Foundation

final class ItemCellViewModel {
    let id: String
    let title: String
    let rating: String
    var onSelected: ((ItemCellViewModel) -> Void)?

    init(item: Item) {
        id = item.id
        title = item.title
        rating = String(format: "%0.0f stars", item.rating)
    }

    func selected() {
        onSelected?(self)
    }
}
