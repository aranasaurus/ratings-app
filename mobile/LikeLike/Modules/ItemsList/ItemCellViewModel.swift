//
//  ItemCellViewModel.swift
//  LikeLike
//
//  Created by Ryan Arana on 9/4/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import Foundation

final class ItemCellViewModel {
    private let item: Item

    var title: String { return item.title }
    var rating: String { return "\(item.rating)" }

    init(item: Item) {
        self.item = item
    }
}

extension ItemCellViewModel: TableViewCellRepresentable {
    typealias TableViewCell = ItemCell
}
