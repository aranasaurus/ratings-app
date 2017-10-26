//
//  ItemsListViewModel.swift
//  LikeLike
//
//  Created by Ryan Arana on 9/4/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

final class ItemsListViewModel {
    static let cellTypes: [TableViewCellViewModel.Type] = [ItemCellViewModel.self]
    private(set) var dataSet: [ItemCellViewModel] = []

    init(items: [ItemCellViewModel]) {
        self.dataSet = items
    }
}
