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
        navigationController.addChildViewController(ViewController(colors: colors))
        navigationController.navigationBar.backgroundColor = colors.background
        navigationController.navigationBar.barTintColor = colors.background
        navigationController.navigationBar.tintColor = colors.highlight
        navigationController.isNavigationBarHidden = true
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}
