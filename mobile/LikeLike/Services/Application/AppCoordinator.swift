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

    private let dataStore: DataStore = FileStorage()

    func start(in window: UIWindow) {
        navigationController.navigationBar.backgroundColor = Colors.background
        navigationController.navigationBar.barTintColor = Colors.background
        navigationController.navigationBar.tintColor = Colors.highlight
        navigationController.navigationBar.prefersLargeTitles = true

        navigationController.navigationBar.largeTitleTextAttributes = Fonts.addShadow(to: Fonts.attributes(size: 57))
        navigationController.navigationBar.titleTextAttributes = Fonts.addShadow(to: Fonts.attributes(size: 27))

        let itemsVC = ItemsListViewController(
            dataSource: DataStoreItemDataSource(dataStore: dataStore),
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
