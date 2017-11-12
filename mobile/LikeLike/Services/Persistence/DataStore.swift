//
//  DataStore.swift
//  LikeLike
//
//  Created by Ryan Arana on 11/11/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import Foundation

protocol DataStore {
    func getAllItems() -> [Item]
    func save(item: Item)
    @discardableResult
    func remove(item: Item) -> Item?
    func getItem(id: String) -> Item?

    var nextItemId: String { get }
}

extension DataStore {
    var nextItemId: String { return UUID().uuidString }

    func createItem(title: String, rating: Double, photoUrl: URL? = nil, comments: String? = nil, tags: [Tag] = []) -> Item {
        return Item(id: nextItemId, title: title, rating: rating, photoUrl: photoUrl, comments: comments, tags: tags)
    }

    func createItem(item: Item) -> Item {
        return createItem(title: item.title, rating: item.rating, photoUrl: item.photoUrl, comments: item.comments, tags: item.tags)
    }
}
