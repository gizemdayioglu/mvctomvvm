//
//  AppDelegate.swift
//  mvc_to_mvvm
//
//  Created by Gizem Gulsen on 7/3/21.
//  Copyright © 2021 Gizem Dayioglu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()

        window?.rootViewController = CustomNavigationController(rootViewController: MusicController())
        return true
    }

}
