//
//  AppDelegate.swift
//  LikeLike
//
//  Created by Ryan Arana on 9/3/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var appCoordinator: AppCoordinator = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        appCoordinator.start(in: UIWindow(frame: UIScreen.main.bounds))
        return true
    }
}

