//
//  AppRouter.swift
//  MainApp
//
//  Created by Mahmoud Abdelwahab on 03/05/2024.
//

import UIKit
import UniversityList

class AppRouter {
    static func start(window: UIWindow?) {
        guard let window = window else {
            fatalError("Window is nil")
        }
        let universityApiService = UniversityApiSevice.shared
        let realmManager = RealmManager.shared
        let initialViewController = UniversityListRouter.assembleModule(universityApiService: universityApiService, realmManager: realmManager)
        
        let navigationController = UINavigationController(rootViewController: initialViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
