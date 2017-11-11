//
//  AppCoordinator.swift
//  LikeLike
//
//  Created by Ryan Arana on 9/4/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

final class AppCoordinator {
    private let navigationController = UINavigationController()
    private var window: UIWindow?

    // TODO: Get get this from the data layer... after you've created one of those.
    private var items = [
        "1": Item(id: "1", title: "Thing 1", rating: 5),
        "2": Item(id: "2", title: "Thing 2", rating: 4)
    ]

    func start(in window: UIWindow) {
        navigationController.navigationBar.backgroundColor = Colors.background
        navigationController.navigationBar.barTintColor = Colors.background
        navigationController.navigationBar.tintColor = Colors.highlight
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: Colors.highlight as Any]

        let itemsVC = ItemsListViewController(
            items: items.values.sorted { $0.title < $1.title },
            itemSelected: showDetails
        )
        navigationController.pushViewController(itemsVC, animated: false)

        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }

    func showDetails(for item: Item) {
        let vc = ItemDetailsViewController(item: item)
        navigationController.pushViewController(vc, animated: true)
    }
}
