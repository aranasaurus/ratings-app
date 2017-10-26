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
    private let colors: Colors
    private var window: UIWindow?

    init(colors: Colors = Colors.default) {
        self.colors = colors
    }

    func start(in window: UIWindow) {
        navigationController.navigationBar.backgroundColor = colors.background
        navigationController.navigationBar.barTintColor = colors.background
        navigationController.navigationBar.tintColor = colors.highlight
        navigationController.isNavigationBarHidden = true

        // TODO: Get get this from the data layer... after you've created one of those.
        let items = [Item(id: "1", title: "Thing 1", rating: 5), Item(id: "2", title: "Thing 2", rating: 4)]
        let itemsVM = ItemsListViewModel(items: items.map(ItemCellViewModel.init(item:)))
        let itemsVC = ItemsListViewController(viewModel: itemsVM, colors: colors)
        navigationController.pushViewController(itemsVC, animated: false)

        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}
