//
//  ItemDataSource.swift
//  LikeLike
//
//  Created by Ryan Arana on 11/11/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import Foundation

protocol ItemDataSource {
    var itemCount: Int { get }
    func item(at indexPath: IndexPath) -> Item
    func reloadData()
}

final class DataStoreItemDataSource {
    private let dataStore: DataStore
    private let sort: (Item, Item) -> Bool
    private var ids: [String] = []

    init(dataStore: DataStore, sort: @escaping (Item, Item) -> Bool = { $0.title < $1.title }) {
        self.dataStore = dataStore
        self.sort = sort

        reloadData()
    }
}

extension DataStoreItemDataSource: ItemDataSource {
    var itemCount: Int {
        return ids.count
    }

    func item(at indexPath: IndexPath) -> Item {
        return dataStore.getItem(id: ids[indexPath.row])!
    }

    func reloadData() {
        self.ids = dataStore.getAllItems().sorted(by: sort).map { $0.id }
    }
}
