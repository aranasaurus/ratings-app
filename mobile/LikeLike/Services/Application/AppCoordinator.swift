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

    // TODO: Get get this from the data layer... after you've created one of those.
    private var items = [
        "1": Item(id: "1", title: "Thing 1", rating: 5),
        "2": Item(id: "2", title: "Thing 2", rating: 4)
    ]

    init(colors: Colors = Colors.default) {
        self.colors = colors
    }

    func start(in window: UIWindow) {
        navigationController.navigationBar.backgroundColor = colors.background
        navigationController.navigationBar.barTintColor = colors.background
        navigationController.navigationBar.tintColor = colors.highlight
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: colors.highlight as Any]

        let itemsVM = ItemsListViewModel(items: items.values.map { ItemCellViewModel(item: $0) }, itemSelected: showDetails)
        let itemsVC = ItemsListViewController(viewModel: itemsVM, colors: colors)
        navigationController.pushViewController(itemsVC, animated: false)

        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }

    func showDetails(for cellItem: ItemCellViewModel) {
        print(cellItem.id + " selected")
        guard let item = items[cellItem.id] else { return }
        let details = ItemDetailsViewModel(item: item)
        let vc = ItemDetailsViewController(item: details, colors: colors)
        navigationController.pushViewController(vc, animated: true)
    }
}
