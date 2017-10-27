//
//  ItemsListViewModel.swift
//  LikeLike
//
//  Created by Ryan Arana on 9/4/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

final class ItemsListViewModel {
    private(set) var dataSet: [ItemCellViewModel] = []

    init(items: [ItemCellViewModel], itemSelected: ((ItemCellViewModel) -> Void)?) {
        self.dataSet = items
        for item in items {
            item.onSelected = itemSelected
        }
    }
}
