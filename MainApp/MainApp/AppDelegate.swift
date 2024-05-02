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
          let universityApiService = UniversityApiSevice.shared
          let realmManager = RealmManager.shared
          let vc = UniversityListRouter.assembleModule(universityApiService: universityApiService, realmManager: realmManager)
          window?.rootViewController = UINavigationController(rootViewController: vc)
          window?.makeKeyAndVisible()
          return true
      }
}

