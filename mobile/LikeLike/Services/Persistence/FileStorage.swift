//
//  FileStorage.swift
//  LikeLike
//
//  Created by Ryan Arana on 11/11/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import Foundation

// FIXME: There's a few try!'s in here that should be handled.

final class FileStorage {
    private let url: URL

    private var loadedItems: [String: Item] = [:] {
        didSet {
            let encoder = JSONEncoder()
            let data = try! encoder.encode(getAllItems())
            try! data.write(to: url)
        }
    }

    init(url: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("data.json")) {
        self.url = url

        guard let data = FileManager.default.contents(atPath: url.path) else { return }

        let decoder = JSONDecoder()
        let items = try! decoder.decode([Item].self, from: data)
        for item in items {
            loadedItems[item.id] = item
        }
        print("Loaded \(items.count) items from \(url).")
    }
}

extension FileStorage: DataStore {
    func getAllItems() -> [Item] {
        return Array(loadedItems.values)
    }

    func save(item: Item) {
        loadedItems[item.id] = item
    }

    func remove(item: Item) -> Item? {
        return loadedItems.removeValue(forKey: item.id)
    }

    func getItem(id: String) -> Item? {
        return loadedItems[id]
    }
}
