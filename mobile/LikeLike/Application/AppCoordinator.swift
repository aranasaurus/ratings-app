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
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.backgroundColor = Colors.background
        navigationController.navigationBar.barTintColor = Colors.background
        navigationController.navigationBar.tintColor = Colors.highlight
        navigationController.navigationBar.prefersLargeTitles = true

        navigationController.navigationBar.largeTitleTextAttributes = Fonts.addShadow(to: Fonts.attributes(size: 44))
        navigationController.navigationBar.titleTextAttributes = Fonts.addShadow(to: Fonts.attributes(size: 27))

        let itemsVC = ItemsListViewController(
            dataSource: DataStoreItemDataSource(dataStore: dataStore),
            itemSelected: showDetails,
            itemRemoved: remove,
            addItemTapped: showCreateItemScene
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

    func remove(item: Item) {
        dataStore.remove(item: item)
    }

    func showCreateItemScene() {
        let vc = CreateItemViewController(createItem: { item in
            let created = self.dataStore.createItem(item: item)
            self.dataStore.save(item: created)
            self.navigationController.popViewController(animated: true)
        })

        vc.view.tintColor = Colors.highlight
        navigationController.pushViewController(vc, animated: true)
    }
}
