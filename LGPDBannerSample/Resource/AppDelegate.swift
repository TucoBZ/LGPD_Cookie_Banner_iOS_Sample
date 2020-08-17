//
//  AppDelegate.swift
//  LGPDBannerSample
//
//  Created by Tulio Bazan on 27/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        guard application.keyWindow == nil else { return true }

        let firstController = ViewController()
        firstController.title = "Home"
        firstController.tabBarItem.title = "Home"
        firstController.tabBarItem.image = UIImage(named: "sf_house")
        let navigationController = UINavigationController(rootViewController: firstController)

        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([navigationController], animated: false)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        //LGPDBannerManager.shared.buildBanner()

        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

