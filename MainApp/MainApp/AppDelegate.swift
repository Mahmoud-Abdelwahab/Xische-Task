//
//  AppDelegate.swift
//  MainApp
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import UIKit
import UniversityList

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

      func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         
          window = UIWindow(frame: UIScreen.main.bounds)
          let vc = UniversityListViewController()
          window?.rootViewController = UINavigationController(rootViewController: vc)
          window?.makeKeyAndVisible()
          return true
      }
}

