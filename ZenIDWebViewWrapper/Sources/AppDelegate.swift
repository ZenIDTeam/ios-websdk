//
//  AppDelegate.swift
//  ZenIDWebViewWrapper
//
//  Created by Libor Polehna on 05.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = HomeComposer.compose()
        window?.makeKeyAndVisible()
        return true
    }

}

