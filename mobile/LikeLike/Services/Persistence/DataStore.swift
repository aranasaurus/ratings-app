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
}
